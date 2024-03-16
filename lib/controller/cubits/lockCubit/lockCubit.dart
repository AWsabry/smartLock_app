import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:logger/logger.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleCubit.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockStates.dart';

class LockCubit extends Cubit<LockStates> {
  LockCubit({required this.bleCubit}) : super(SuperLockStates());

  static LockCubit get(context) => BlocProvider.of(context);
  // ble Cubit Extend
  final BleCubit bleCubit;
  // ble Connection Check

  // Check if the dor is locked or not
  bool isLocked = true;
  // Check if the door is opened or not
  bool isDoorOpen = true;

  List<int> valueInDevice = [];
  var batteryValue;
  var doorIsOpenValueFromDevice;
  var characteristicsValues;

  String deviceId = '40:4C:CA:41:2A:66';
  String deviceName = 'Smart Lock FP1 Test';

// Check if the door is Opened
  Future<bool> isOpen() async {
    try {
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

  // Function to Check if the door is Locked or not
  Future lockStateCharacteristics() async {
    try {
      int value = await bleCubit.readDataFromBle(
        serviceId: Uuid.parse('AAAA'),
        characteristicId: Uuid.parse('AA01'),
      );
      bleCubit.isConnected = true;
      characteristicsValues = value;
      Logger().i("characteristicsValues Value is $characteristicsValues");
      emit(ReadTheLockStateCharacteristicsSuccessfully());
    } catch (e) {
      Logger().e('Error in the Try of lockStateCharacteristics Function');
      Logger().e(e);
      emit(FailedToReadTheLockStateCharacteristics());
    }
  }

  // Lock & Unlock
  Future<void> lockControl({required String data}) async {
    try {
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
          break;
        case '3':
          emit(UnlockedSuccessfully());
          isLocked == false;
          break;
        default:
      }
    } catch (e) {
      Logger().e('Error in the Try of lockControl Function');
      Logger().e(e);
      emit(WriteFailed());
    }
  }

  //  Read the battery Values
  Future<void> batteryValues() async {
    try {
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
  }

  Future<void> calibrationControl() async {
    try {
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

  // Function to Calibrate the lock
  Future<void> lockingMechanismCalibration({required String data}) async {
    try {
      bleCubit.writeDataToBle(
        serviceId: Uuid.parse('DDDD'),
        characteristicId: Uuid.parse('DD02'),
        data: data,
      );
      bleCubit.isConnected = true;
      emit(WriteSuccessfully());
      switch (data) {
        case '2':
          break;
        case '3':
          break;
        case '4':
          break;
        case '5':
          break;
        default:
      }
    } catch (e) {
      Logger().e('Error in the Try of lockControl Function');
      Logger().e(e);
      emit(WriteFailed());
    }
  }

  Future<void> calibrationCharacteristic() async {
    try {
      int value = await bleCubit.readDataFromBle(
        serviceId: Uuid.parse('DDDD'),
        characteristicId: Uuid.parse('DD04'),
      );
      bleCubit.isConnected = true;
      // Switch Case to check if the Calibration Success or not
      switch (value) {
        case 2:
          break;
        case 3:
          break;
        case 4:
          break;
        default:
          break;
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
