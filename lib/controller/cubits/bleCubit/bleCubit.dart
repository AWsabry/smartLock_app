import 'dart:async';
import 'dart:developer';

import 'package:bluetooth_enable_fork/bluetooth_enable_fork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:location/location.dart' hide PermissionStatus;
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleStates.dart';

class BleCubit extends Cubit<BleStates> {
  BleCubit() : super(SuperBleStates());
  static BleCubit get(context) => BlocProvider.of(context);
  var found = false;
  final _ble = FlutterReactiveBle();
  bool isConnected = false;
  StreamSubscription<DiscoveredDevice>? scanSub;
  StreamSubscription<ConnectionStateUpdate>? connectSub;
  StreamSubscription<List<int>>? notifySub;

  String deviceId = '40:4C:CA:48:54:1A';
  String deviceName = 'Smart Lock FP1 Test';
  DiscoveredDevice? discoveredDevice;
  String? discoveredDeviceName;

  String? discoveredDeviceId;

  List<int> valueInDevice = [];

  Future<void> requestBluetoothPermission(
      {required BuildContext context}) async {
    Logger().i('Entered');
    final bluetoothEnabled = await BluetoothEnable.enableBluetooth;
    PermissionStatus locationPermission = await Permission.location.request();
    PermissionStatus bleScan = await Permission.bluetoothScan.request();
    PermissionStatus bleConnect = await Permission.bluetoothConnect.request();
    final location = Location();
    final locationAccess = await location.serviceEnabled();

    if (bluetoothEnabled == "true" &&
        locationPermission.isGranted &&
        bleScan.isGranted &&
        bleConnect.isGranted &&
        locationAccess == true) {
      if (state is SuccessFullyFoundDevice) {
      } else if (state is SuccessFullyConnected) {
      } else {
        scanSub = _ble.scanForDevices(
          withServices: [],
          scanMode: ScanMode.lowLatency,
        ).listen(
          (device) {
            log(device.name);
            if (device.name.isNotEmpty && device.name == deviceName) {
              Logger().e(state);

              discoveredDeviceName = device.name;
              discoveredDeviceId = device.id;
              discoveredDevice = device;
              scanForDevice(device: discoveredDevice!, context: context);
              scanSub!.cancel();
            }
          },
        );
      }
    } else if (locationPermission.isDenied) {
      log("aaa");

      await Permission.location.request();
    } else if (locationAccess == false) {
      await location.requestService();
    } else {
      log("Khaled");
      await BluetoothEnable.enableBluetooth;
    }
  }

  Future<void> scanForDevice({
    required DiscoveredDevice device,
    required BuildContext context,
  }) async {
    if (device.name == deviceName) {
      deviceId = device.id;

      found = true;
      try {
        emit(SuccessFullyFoundDevice());
        connectDevice(deviceId: device.id);
        Logger().f("Connected True");
      } catch (e) {
        emit(FailedToFindDevice());
        Logger().f("Connected False");
      }
    }
  }

  Future<StreamSubscription<ConnectionStateUpdate>?> connectDevice(
      {required String deviceId}) async {
    connectSub = _ble
        .connectToDevice(
            id: deviceId, connectionTimeout: const Duration(seconds: 30))
        .listen((update) {
      Logger().i(update);

      if (update.connectionState == DeviceConnectionState.connecting) {
        Logger().i('Connecting ...');

        // isConnected = false;
        emit(SuccessFullyFoundDevice());
      } else if (update.connectionState == DeviceConnectionState.connected) {
        Logger().i(update);
        Logger().d('Connected');
        isConnected = true;
        emit(SuccessFullyConnected());
      } else if (update.connectionState == DeviceConnectionState.disconnected) {
        Logger().i('disconnected');
        emit(FailedToConnect());
      } else {
        Logger().i("loooooooool$update");
        isConnected = false;
      }
    }, onError: (Object error) {
      Logger().i("errrrrrrrrrorrrrrrr $error");
      emit(FailedToConnect());

      // Handle a possible error
    });
    return connectSub;
  }

  testConnecting() {
    _ble
        .connectToDevice(
            id: deviceId, connectionTimeout: const Duration(seconds: 30))
        .listen((event) {
      Logger().i(event);
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
      Logger().i("Reading in the Read Function ${valueInDevice[0]}");
      return valueInDevice[0];
    } catch (error) {
      Logger().e('Error reading characteristic: $error');
      rethrow; // Rethrow the error to be caught by the caller
    }
  }

  void writeDataToBle({
    required Uuid serviceId,
    required Uuid characteristicId,
    required int data,
  }) {
    final characteristic = QualifiedCharacteristic(
      deviceId: deviceId.toString(),
      serviceId: serviceId,
      characteristicId: characteristicId,
    );

    _ble.writeCharacteristicWithoutResponse(characteristic, value: [data]).then(
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
