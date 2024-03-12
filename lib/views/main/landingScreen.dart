import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_lock_app/components/buttons/SecondaryButton.dart';
import 'package:smart_lock_app/components/buttons/primaryButton.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleCubit.dart';
import 'package:smart_lock_app/views/auth/loginScreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final flutterBle = FlutterReactiveBle();

  @override
  initState() {
    final ble = BlocProvider.of<BleCubit>(context);
    super.initState();
    ble.requestLocationPermission();
    ble.scanSub =
        flutterBle.scanForDevices(withServices: []).listen(ble.scanForDevice);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 390.w,
                  height: 241.h,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(31, 41, 55, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/Images/loginImage.png',
                      fit: BoxFit.cover,
                      width: 390.w,
                      height: 241.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.h, right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'I received an Invitation',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 58.h, left: 16.w, right: 108.w),
              child: Text(
                'Empowering You with Intelligent Locking',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color.fromRGBO(75, 85, 99, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 27.w),
              child: Text(
                'Unlock the power of smart living with Sherlock. Sherlock puts you in control, allowing you to manage access, monitor activity, and safeguard your home or office with just a few taps.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color.fromRGBO(107, 114, 128, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 108.h,
            ),
            PrimaryButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              title: 'Setup My Lock',
            ),
            SizedBox(
              height: 15.h,
            ),
            SecondaryButton(
              onTap: () {},
              title: 'I received an invitation',
            )
          ],
        ),
      ),
    );
  }
}
