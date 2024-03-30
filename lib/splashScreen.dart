import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleCubit.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleStates.dart';
import 'package:smart_lock_app/views/lockDetails/lockAndUnlock.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // final _ble = FlutterReactiveBle();

  @override
  void initState() {
    super.initState();
    final bleCubit = BleCubit.get(context);

    if (bleCubit.state is SuccessFullyFoundDevice) {
      bleCubit.isConnected = false;
      Logger().i("Device Found");
    } else if (bleCubit.state is SuccessFullyConnected) {
      bleCubit.isConnected = true;
    } else {
      bleCubit.requestLocationPermission(context: context);
      bleCubit.isConnected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BleCubit, BleStates>(
        builder: (BuildContext context, BleStates state) {
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      return Scaffold(
        key: scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LockAndUnlock()));
                },
                child: const Text("Press")),
            Center(
                child:
                    Text("Connected is ${BleCubit.get(context).isConnected}")),
            Center(child: Text("Connected is ${BleCubit.get(context).state}")),
          ],
        ),
      );
    });
  }
}
