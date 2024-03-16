import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleStates.dart';

class BleCubit extends Cubit<BleStates> {
  BleCubit() : super(SuperBleStates());
  static BleCubit get(context) => BlocProvider.of(context);
  var _found = false;
  final _ble = FlutterReactiveBle();
  bool isConnected = true;
  StreamSubscription<DiscoveredDevice>? scanSub;
  StreamSubscription<ConnectionStateUpdate>? connectSub;
  StreamSubscription<List<int>>? notifySub;

  String deviceId = '7E:A5:42:90:BF:F5';
  String deviceName = 'Smart Lock FP1 Test';

  List<int> valueInDevice = [];

  Future<void> requestLocationPermission(
      {required BuildContext context}) async {
    PermissionStatus locationPermission = await Permission.location.request();
    PermissionStatus bleScan = await Permission.bluetoothScan.request();
    PermissionStatus bleConnect = await Permission.bluetoothConnect.request();
    var status = await Permission.location.request();

    // Permission granted, proceed with BLE scanning
    if (status.isGranted) {
      if (state is SuccessFullyFoundDevice || state is SuccessFullyConnected) {
      } else {
        scanSub = _ble.scanForDevices(
          withServices: [],
          scanMode: ScanMode.lowLatency,
        ).listen((device) {
          scanForDevice(device: device, context: context);
        });
      }
    } else if (status.isDenied) {
      // Explain to the user why location permission is needed
      locationPermission;
      // Optionally, request permission again
    } else if (status.isPermanentlyDenied) {
      // Open app settings to allow permission
      await openAppSettings();
    }
  }

  Future<void> scanForDevice({
    required DiscoveredDevice device,
    required BuildContext context,
  }) async {
    log('State: ${state.toString()}');

    // Scanning for device
    switch (state) {
      // In case connected Stop Scanning
      case SuccessFullyFoundDevice():
        emit(SuccessFullyFoundDevice());
        break;
      case SuccessFullyConnected():
        isConnected = true;
        emit(SuccessFullyConnected());

        break;
      default:
        emit(ScanningDevice());

        Logger().i('Scanning For Device');
        if (device.name == deviceName || device.id == deviceId) {
          _found = true;
          Logger().i(_found);

          try {
            Logger().i("Wala");

            connectDevice(deviceId: deviceId);
            // Logger().i('Device Connected SuccessFully');
            // emit(SuccessFullyConnected());
          } catch (e) {
            Logger().e(e);
            emit(FailedToFindDevice());
          }
        }

        break; // Handle other cases if necessary
    }
  }

  Future<void> connectDevice({required String deviceId}) async {
    connectSub = _ble
        .connectToDevice(
      id: deviceId,
    )
        .listen((update) {
      if (update.connectionState == DeviceConnectionState.connected) {
        Logger().d('Connected');
        isConnected = true;
        emit(SuccessFullyConnected());
      } else if (update.connectionState == DeviceConnectionState.connecting) {
        Logger().i('Connecting ...');
        isConnected = false;
        emit(SuccessFullyFoundDevice());
      } else if (update.failure == true) {
        Logger().i('Failure');
      } else {
        isConnected = false;
        emit(ScanningDevice());
      }
    });
  }

  Future<int> readDataFromBle({
    required Uuid serviceId,
    required Uuid characteristicId,
  }) async {
    Logger().i('Reading ..');
    Logger().i(state);
    try {
      Logger().i('readCharacteristic');
      List<int> valueInDevice = await _ble.readCharacteristic(
        QualifiedCharacteristic(
          deviceId: deviceId.toString(),
          serviceId: serviceId,
          characteristicId: characteristicId,
        ),
      );
      Logger().i(valueInDevice[0]);
      return valueInDevice[0];
    } catch (error) {
      Logger().e('Error reading characteristic: $error');
      rethrow; // Rethrow the error to be caught by the caller
    }
  }

  void writeDataToBle({
    required Uuid serviceId,
    required Uuid characteristicId,
    required String data,
  }) {
    final characteristic = QualifiedCharacteristic(
      deviceId: deviceId.toString(),
      serviceId: serviceId,
      characteristicId: characteristicId,
    );

    // Convert the data to bytes before writing
    List<int> dataBytes = utf8.encode(data);
    _ble
        .writeCharacteristicWithoutResponse(characteristic, value: dataBytes)
        .then(
      (_) {
        Logger().d("Write successful");
      },
    ).catchError(
      (error) {
        print('Error writing to characteristic: $error');
      },
    );
  }
}
