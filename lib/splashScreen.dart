import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
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
  final _ble = FlutterReactiveBle();

  @override
  void initState() {
    super.initState();
    final bleCubit = BlocProvider.of<BleCubit>(context);

    if (bleCubit.state == SuccessFullyFoundDevice()) {
      bleCubit.isConnected = false;
      Logger().i("Device Found");
    } else if (bleCubit.state == SuccessFullyConnected()) {
      bleCubit.isConnected = true;
    } else {
      bleCubit.requestLocationPermission(context: context);
      bleCubit.isConnected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BleCubit, BleStates>(builder: (context, state) {
      final bleCubit = BlocProvider.of<BleCubit>(context);
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

      return Scaffold(
        key: scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LockAndUnlock();
                      },
                    ),
                  );
                },
                child: const Text("asd")),
            // AnimatedOpacity(
            //   opacity: bleCubit.isConnected ? 0.5 : 1.0,
            //   duration: const Duration(milliseconds: 500),
            //   child: Text(
            //     bleCubit.isConnected ? 'Navigating...' : 'Your text',
            //     style: const TextStyle(fontSize: 24),
            //   ),
            // ),
            Center(child: Text("Connected is ${bleCubit.isConnected}")),
            Center(child: Text("Connected is ${bleCubit.state}")),
          ],
        ),
      );
    });
  }
}
