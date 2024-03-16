import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:logger/logger.dart';
import 'package:smart_lock_app/components/lockStatus/lockClosed.dart';
import 'package:smart_lock_app/components/lockStatus/lockDisconnect.dart';
import 'package:smart_lock_app/components/lockStatus/lockOpen.dart';
import 'package:smart_lock_app/components/lockStatus/unlockClosed.dart';
import 'package:smart_lock_app/components/lockStatus/unlockOpen.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleCubit.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockStates.dart';

class LockCubit extends Cubit<LockStates> {
  LockCubit() : super(SuperLockStates());

  static LockCubit get(context) => BlocProvider.of(context);

  // Check if the dor is locked or not
  bool isLocked = true;
  // Check if the door is opened or not
  bool isDoorOpen = true;
  // Calibration Check
  bool calibrationSuccess = false;

  List<int> valueInDevice = [];
  // ignore: prefer_typing_uninitialized_variables
  var batteryValue;
  // ignore: prefer_typing_uninitialized_variables
  var doorIsOpenValueFromDevice;
  // ignore: prefer_typing_uninitialized_variables
  var characteristicsValues;

  String deviceId = '40:4C:CA:41:2A:66';
  String deviceName = 'Smart Lock FP1 Test';

  List<String> lockStateList = [
    'CLP',
    'CULP',
    'JLP',
    'JULP',
  ];
  // Check Lock Value
  int lockStateValue = 0;

  // ble Connection Check
  Future<bool> checkConnection(context) async {
    BleCubit bleCubit = BlocProvider.of<BleCubit>(context);
    if (bleCubit.isConnected) {
      return true;
    } else {
      bleCubit.isConnected == false;
      lockStateValue = 0;
    }
    return true;
  }

// Check if the door is Opened
  Future<bool> isOpen(context) async {
    try {
      var bleCubit = BleCubit.get(context);
      int value = await bleCubit.readDataFromBle(
        serviceId: Uuid.parse('AAAA'),
        characteristicId: Uuid.parse('AA02'),
      );
      bleCubit.isConnected = true;
      doorIsOpenValueFromDevice = value;
      // Switch Case to check if the door is opened or not
      switch (value) {
        case 2:
          Logger().i("Door Value is Open");
          isDoorOpen = true;
          emit(DoorIsOpen());
          return doorIsOpenValueFromDevice = true;
        case 3:
          Logger().i("Door Value is Closed");
          isDoorOpen = false;
          emit(DoorIsClosed());
          return doorIsOpenValueFromDevice = false;
        default:
          break;
      }
    } catch (e) {
      Logger().e(e);
    }
    return isDoorOpen;
  }

  // Function to read the lock state values
  Future<int> readLockStateValues(BuildContext context) async {
    if (await checkConnection(context)) {
      try {
        var bleCubit = BleCubit.get(context);
        int value = await bleCubit.readDataFromBle(
          serviceId: Uuid.parse('AAAA'),
          characteristicId: Uuid.parse('AA01'),
        );
        bleCubit.isConnected = true;
        characteristicsValues = value;
        Logger().i("characteristicsValues Value is $characteristicsValues");
        emit(ReadTheLockStateCharacteristicsSuccessfully());
        switch (characteristicsValues) {
          case 2:
            lockStateValue = 2;
            return lockStateValue;
          case 3:
            lockStateValue = 3;
            return lockStateValue;
          case 4:
            lockStateValue = 4;
            return lockStateValue;
          case 5:
            lockStateValue = 5;
            return lockStateValue;
          default:
            return lockStateValue = 0;
        }
      } catch (e) {
        Logger().e('Error in the Try of readLockStateValues Function');
        Logger().e(e);
        emit(FailedToReadTheLockStateCharacteristics());
        return 0; // Return a default value to indicate error
      }
    } else {
      Logger().e('Ble Connection Failed');
      emit(FailedToReadTheLockStateCharacteristics());
      return 0;
    }
  }

  // Function to render the Future<Widget>
  Future<Widget> renderLockStateWidget(BuildContext context) async {
    if (await checkConnection(context)) {
      switch (lockStateValue) {
        case 0:
          return const LockDisconnected();
        case 2:
          Logger().i('State is ${lockStateList[0]} with value $lockStateValue');
          return const LockClosed();
        case 3:
          Logger().i('State is ${lockStateList[1]} with value $lockStateValue');
          return const UnlockClosed();
        case 4:
          Logger().i('State is ${lockStateList[2]} with value $lockStateValue');
          return const LockOpen();
        case 5:
          Logger().i('State is ${lockStateList[3]} with value $lockStateValue');
          return const UnlockOpen();
        default:
          return const Text("Error in Connections");
      }
    } else {
      return const LockDisconnected();
    }
  }

  // Lock & Unlock
  Future<void> lockControl(context, {required String data}) async {
    try {
      var bleCubit = BleCubit.get(context);

      bleCubit.writeDataToBle(
        serviceId: Uuid.parse('AAAA'),
        characteristicId: Uuid.parse('AA03'),
        data: data,
      );
      bleCubit.isConnected = true;
      Logger().i("Write successful");
      emit(WriteSuccessfully());
      switch (data) {
        case '2':
          emit(LockedSuccessfully());
          isLocked == true;
          Logger().i("isLocked + $isLocked");
          break;
        case '3':
          emit(UnlockedSuccessfully());
          isLocked == false;
          Logger().i("isLocked + $isLocked");
          break;
        default:
          break;
      }
    } catch (e) {
      Logger().e('Error in the Try of lockControl Function');
      Logger().e(e);
      emit(WriteFailed());
    }
  }

  // Read the battery Values
  Future<void> batteryValues(context) async {
    if (await checkConnection(context)) {
      try {
        var bleCubit = BleCubit.get(context);

        bleCubit.isConnected = true;
        int value = await bleCubit.readDataFromBle(
          serviceId: Uuid.parse('CCCC'),
          characteristicId: Uuid.parse('CC01'),
        );

        batteryValue = value;
        Logger().i("Battery Value is $batteryValue");
        emit(SuccessReadBatteryValues());
      } catch (e) {
        Logger().e('Error in the Try of batteryValues Function');
        Logger().e(e);
        emit(FailedToReadBatteryValues());
      }
    } else {
      Logger().e('Connection Failed');
      emit(FailedToReadBatteryValues());
    }
  }

  // Permission To start Calibrating
  Future<void> calibrationControl(context) async {
    try {
      var bleCubit = BleCubit.get(context);

      bleCubit.writeDataToBle(
        serviceId: Uuid.parse('DDDD'),
        characteristicId: Uuid.parse('DD01'),
        data: '1',
      );
      bleCubit.isConnected = true;
      emit(WriteSuccessfully());
    } catch (e) {
      Logger().e('Error in the Try of lockControl Function');
      Logger().e(e);
      emit(WriteFailed());
    }
  }

  // Calibrating Status
  Future calibrationCharacteristic(context) async {
    try {
      var bleCubit = BleCubit.get(context);

      int value = await bleCubit.readDataFromBle(
        serviceId: Uuid.parse('DDDD'),
        characteristicId: Uuid.parse('DD04'),
      );
      bleCubit.isConnected = true;
      Logger().i('State Written is $value');
      // Switch Case to check if the Calibration Success or not
      switch (value) {
        case 2:
          calibrationSuccess = true;
          return true;
        case 3:
          return false;
        case 4:
          return 'in Progress';
        default:
          return 'in Progress';
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  // Function to Calibrate the lock
  Future lockingMechanismCalibration(context, {required String data}) async {
    // calibrationCharacteristic(context);
    try {
      var bleCubit = BleCubit.get(context);

      bleCubit.writeDataToBle(
        serviceId: Uuid.parse('DDDD'),
        characteristicId: Uuid.parse('DD02'),
        data: data,
      );
      bleCubit.isConnected = true;
      emit(WriteSuccessfully());
      switch (data) {
        case '2':
          Logger().i(
              'State Written is ${lockStateList[0]} with value $lockStateValue');
          data = lockStateValue.toString();
          return lockStateList[0];
        case '3':
          Logger().i(
              'State Written is ${lockStateList[1]} with value $lockStateValue');
          data = lockStateValue.toString();
          return lockStateList[1];
        case '4':
          Logger().i(
              'State Written is ${lockStateList[2]} with value $lockStateValue');
          data = lockStateValue.toString();
          return lockStateList[2];
        case '5':
          Logger().i(
              'State Written is ${lockStateList[3]} with value $lockStateValue');
          data = lockStateValue.toString();
          return lockStateList[3];
        default:
          break;
      }
    } catch (e) {
      Logger().e('Error in the Try of lockControl Function');
      Logger().e(e);
      emit(WriteFailed());
    }
  }
}
