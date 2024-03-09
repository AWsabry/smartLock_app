import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:logger/logger.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleStates.dart';

class BleCubit extends Cubit<BleStates> {
  BleCubit() : super(SuperBleStates());

  static BleCubit get(context) => BlocProvider.of(context);
  var _found = false;
  final _ble = FlutterReactiveBle();

  StreamSubscription<DiscoveredDevice>? scanSub;
  StreamSubscription<ConnectionStateUpdate>? connectSub;
  StreamSubscription<List<int>>? notifySub;

  String deviceId = '40:4C:CA:41:2A:66';
  String deviceName = 'Smart Lock FP1 Test';

  deviceScan() {
    Logger().i('Scan in Screen');

    scanSub = _ble.scanForDevices(withServices: []).listen(scanForDevice);
  }

  void scanForDevice(DiscoveredDevice device) {
    Logger().i('Scanning For Device');
    if (device.name == deviceName || device.id == deviceId && !_found) {
      _found = true;
      try {
        connectDevice(deviceId: deviceId);
        Logger().i('Device Connected SuccessFully');
      } catch (e) {
        Logger().e(e);
      }
    }
  }

  void connectDevice({required String deviceId}) {
    connectSub = _ble.connectToDevice(id: deviceId).listen((update) {
      Logger().i('Connecting ..');
      if (update.connectionState == DeviceConnectionState.connected) {
        Logger().d('Connected');
      }
    });
  }

  List<int> valueInDevice = [];
  Future readDataFromBle(
      {required Uuid serviceId, required Uuid characteristicId}) async {
    Logger().i('Reading ..');

    await _ble
        .readCharacteristic(
      QualifiedCharacteristic(
          deviceId: deviceId.toString(),
          serviceId: serviceId,
          characteristicId: characteristicId),
    )
        .then((value) {
      valueInDevice = value;
      Logger().i('Value is " + batteryValue');
    }).catchError((error) {
      Logger().e('Error reading characteristic: $error');
    });
  }
}
