import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockStates.dart';

class LockCubit extends Cubit<LockStates> {
  LockCubit() : super(SuperLockStates());

  static LockCubit get(context) => BlocProvider.of(context);
  bool isConnected = false;
  bool isLocked = true;
  bool isOpen = false;

  late int value;

// This Function is Responsible for the state emits based on the variables that is located above and changed by the functions
  void toggleLock() {
    switch (isLocked) {
      case true:
        emit(UnlockedSuccessfully());
      case false:
        emit(LockedSuccessfully());
        break;
      default:
        ConnectionFailed();
    }
    isLocked = !isLocked;
    Logger().i(state);
  }

  // Function to Check if the door is Locked or not
  Future<bool> lockedCheck() async {
    return true;
  }

  // Function to check if the door is unlocked or not
  Future<bool> unlockedCheck() async {
    return true;
  }

  Future<bool> lock() async {
    return true;
  }

  Future<bool> unlock() async {
    return true;
  }

  Future<bool> lockErrorCheck() async {
    return true;
  }
}
