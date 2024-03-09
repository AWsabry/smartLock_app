import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lock_app/controller/battaryCubit/batteryStates.dart';

class BatteryCubit extends Cubit<BatteryStates> {
  BatteryCubit() : super(SuperBatteryStates());

  static BatteryCubit get(context) => BlocProvider.of(context);

  late int value;

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
