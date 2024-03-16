import 'package:logger/logger.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockCubit.dart';

class LockActions {
  final LockCubit lockCubit;
  LockActions(this.lockCubit);

  // Lock
  Future<void> lockAction(
    context,
  ) async {
    try {
      lockCubit.lockControl(context, data: '2');
      Logger().i('Door Locked');
    } catch (e) {
      Logger().e('Error in Locking Function');
      Logger().e(e);
    }
  }

  // Unlock
  Future<void> unLockAction(
    context,
  ) async {
    try {
      lockCubit.lockControl(context, data: '3');
    } catch (e) {
      Logger().e('Error in Unlocking Function');
      Logger().e(e);
    }
  }

  Future<void> enterCompletelyUnlockedPosition(
    context,
  ) async {
    try {
      lockCubit.lockingMechanismCalibration(context, data: '3');
    } catch (e) {
      Logger().e('Error in Unlocking Function');
      Logger().e(e);
    }
  }

  Future<void> enterCompletelyLockedPosition(
    context,
  ) async {
    try {
      lockCubit.lockingMechanismCalibration(context, data: '2');
    } catch (e) {
      Logger().e('Error in Unlocking Function');
      Logger().e(e);
    }
  }

  Future<void> enterAjarLockedPosition(
    context,
  ) async {
    try {
      lockCubit.lockingMechanismCalibration(context, data: '4');
    } catch (e) {
      Logger().e('Error in Unlocking Function');
      Logger().e(e);
    }
  }

  Future<void> enterAjarUnlockedPosition(
    context,
  ) async {
    try {
      lockCubit.lockingMechanismCalibration(context, data: '5');
    } catch (e) {
      Logger().e('Error in Unlocking Function');
      Logger().e(e);
    }
  }
}
