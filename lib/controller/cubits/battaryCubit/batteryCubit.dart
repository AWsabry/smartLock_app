import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:logger/logger.dart';
import 'package:smart_lock_app/controller/cubits/battaryCubit/batteryStates.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleCubit.dart';

class BatteryCubit extends Cubit<BatteryStates> {
  BatteryCubit({required this.bleCubit}) : super(SuperBatteryStates());
  final BleCubit bleCubit;
  static BatteryCubit get(context) => BlocProvider.of(context);

  var batteryValue;
  Future batteryValues() async {
    try {
      await bleCubit
          .readDataFromBle(
        serviceId: Uuid.parse('CCCC'),
        characteristicId: Uuid.parse('CC01'),
      )
          .then((value) {
        batteryValue = value;

        Logger().i("Battery Value is " + batteryValue);
        emit(SuccessReadBatteryValues());
      }).catchError((onError) {
        Logger().e(
            "Error in the readDataFromBle Function that is Called in the Battery Cubit");
        Logger().e(onError);
        emit(FailedToReadBatteryValues());
      });
    } catch (e) {
      Logger().e('Error in the Try of batteryValues Function');
      Logger().e(e);
      emit(FailedToReadBatteryValues());
    }
  }
}
