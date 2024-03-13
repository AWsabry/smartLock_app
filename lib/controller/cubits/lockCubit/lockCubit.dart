import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:logger/logger.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleCubit.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockStates.dart';

class LockCubit extends Cubit<LockStates> {
  LockCubit({required this.bleCubit}) : super(SuperLockStates());

  static LockCubit get(context) => BlocProvider.of(context);
  final _ble = FlutterReactiveBle();

  // ble Connection Check
  bool isConnected = false;
  // Check if the dor is locked or not
  bool isLocked = true;
  // Check if the door is opened or not
  bool isDoorOpen = true;
  final BleCubit bleCubit;
  List<int> valueInDevice = [];
  var batteryValue;
  var doorIsOpenValueFromDevice;
  var characteristicsValues;

  String deviceId = '40:4C:CA:41:2A:66';
  String deviceName = 'Smart Lock FP1 Test';

// This Test Function is Responsible for the state emits based on the variables that is located above and changed by the functions
  // void toggleLock() {
  //   switch (isDoorOpen) {
  //     case true:
  //       emit(UnlockedSuccessfully());
  //     case false:
  //       emit(LockedSuccessfully());
  //       break;
  //     default:
  //       BleConnectionFailed();
  //   }
  //   isDoorOpen = !isDoorOpen;
  //   Logger().i(state);
  // }

// Check if the door is Opened
  Future<bool> isOpen() async {
    try {
      int value = await bleCubit.readDataFromBle(
        serviceId: Uuid.parse('AAAA'),
        characteristicId: Uuid.parse('AA02'),
      );
      isConnected = true;
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
      isConnected = true;
      characteristicsValues = value;
      Logger().i("characteristicsValues Value is $characteristicsValues");
      emit(ReadTheLockStateCharacteristicsSuccessfully());
    } catch (e) {
      Logger().e('Error in the Try of lockStateCharacteristics Function');
      Logger().e(e);
      emit(FailedToReadTheLockStateCharacteristics());
    }
  }

  // Lock&Unlock
  Future<void> lockControl({required String data}) async {
    try {
      bleCubit.writeDataToBle(
        serviceId: Uuid.parse('AAAA'),
        characteristicId: Uuid.parse('AA03'),
        data: data,
      );
      isConnected = true;
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
      isConnected = true;
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
}
