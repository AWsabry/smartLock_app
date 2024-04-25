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
  bool? calibrationSuccess;

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
        // emit(ReadTheLockStateCharacteristicsSuccessfully());
        switch (characteristicsValues) {
          case 2:
            lockStateValue = 2;
            emit(LockedSuccessfully());
            return lockStateValue;
          case 3:
            lockStateValue = 3;
            // CULP
            emit(UnlockedSuccessfully());
            return lockStateValue;
          case 4:
            lockStateValue = 4;
            // Ajar Locked Value but for now Locked
            emit(LockedSuccessfully());
            return lockStateValue;
          case 5:
            lockStateValue = 5;
            // Ajar Unlocked Value but for now unlocked
            emit(UnlockedSuccessfully());
            return lockStateValue;
          default:
            return lockStateValue = 0;
        }
      } catch (e) {
        Logger().e('Error in the Try of readLockStateValues Function');
        Logger().e(e);
        // emit(FailedToReadTheLockStateCharacteristics());
        return 0; // Return a default value to indicate error
      }
    } else {
      Logger().e('Ble Connection Failed');
      emit(FailedToReadTheLockStateCharacteristics());
      return 0;
    }
  }

  // Function to render the Future<Widget>

  // ____ Will be Used to check the current state and render to the Future Function in the lock and unlock Screen Line 207 in the Future Widget__ //

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

  Future<Widget> renderLockAndUnlockWidgets(context) async {
    if (await checkConnection(context)) {
      Logger().f(state.toString());
      switch (state) {
        case LockedSuccessfully():
          return const LockClosed();
        case UnlockedSuccessfully():
          Logger().i('State is ${lockStateList[0]} with value $lockStateValue');

          return const UnlockClosed();
        default:
          return const UnlockClosed();
      }
    } else {
      return const LockDisconnected();
    }
  }

  // Lock & Unlock
  Future<void> lockControl(context, {required int data}) async {
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
      Logger().e("data is $data");
      switch (data) {
        case 2:
          emit(LockedSuccessfully());
          isLocked == true;
          Logger().i("isLocked + $isLocked");
          break;
        case 3:
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
  Future<bool> batteryValues(context) async {
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
        // emit(SuccessReadBatteryValues());
        return true;
      } catch (e) {
        Logger().e('Error in the Try of batteryValues Function');
        Logger().e(e);
        // emit(FailedToReadBatteryValues());
        return false;
      }
    } else {
      Logger().e('Connection Failed');
      // emit(FailedToReadBatteryValues());
      return false;
    }
  }

  // Permission To start Calibrating
  Future<void> startCalibration(context) async {
    Logger().e('Calibration Started');
    try {
      var bleCubit = BleCubit.get(context);

      bleCubit.writeDataToBle(
        serviceId: Uuid.parse('DDDD'),
        characteristicId: Uuid.parse('DD01'),
        data: 1,
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
  Future<bool> calibrationCharacteristic(context) async {
    print("Calibration Response");
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
          calibrationSuccess = false;
          return false;
        case 4:
          return false;
        default:
          return false;
      }
    } catch (e) {
      Logger().e(e);
    }
    Logger().i('State Written is $calibrationSuccess');
    return calibrationSuccess!;
  }

  // Function to Calibrate the lock
  Future lockingMechanismCalibration(context, {required int data}) async {
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
        case 2:
          Logger().i('State Written is ${lockStateList[0]} with value $data');
          return lockStateList[0];
        case 3:
          Logger().i('State Written is ${lockStateList[1]} with value $data');
          return lockStateList[1];
        case 4:
          Logger().i('State Written is ${lockStateList[2]} with value $data');
          return lockStateList[2];
        case 5:
          Logger().i('State Written is ${lockStateList[3]} with value $data');
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
