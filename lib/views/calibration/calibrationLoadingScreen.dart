import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/CustomAppBar.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockCubit.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockStates.dart';
import 'package:smart_lock_app/views/calibration/calibrationSuccessScreen.dart';

class CalibrationLoadingScreen extends StatefulWidget {
  const CalibrationLoadingScreen({super.key});

  @override
  State<CalibrationLoadingScreen> createState() =>
      _CalibrationLoadingScreenState();
}

class _CalibrationLoadingScreenState extends State<CalibrationLoadingScreen> {
  bool? isCalibrated;

  @override
  void initState() {
    super.initState();
    LockCubit cubit = BlocProvider.of<LockCubit>(context);
    cubit.calibrationCharacteristic(context).then((value) {
      isCalibrated = value;
    });
    Timer(const Duration(seconds: 10), () {
      log(isCalibrated.toString());
      if (isCalibrated == true) {
        log("Success");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CalibrationSuccess(),
          ),
        );
      } else {
        log("error");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CalibrationSuccess(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LockCubit, LockStates>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
        appBar: const CustomAppBar(title: 'Calibrate Your Lock'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 106.92.h,
                ),
                SvgPicture.asset('assets/Icons/LoadingIcon.svg'),
                SizedBox(height: 93.92.h),
                Padding(
                  padding: EdgeInsets.only(left: 60.0.w),
                  child: Text(
                    "Wait a few momments please",
                    style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(53, 52, 54, 1)),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Your Lock should be locking and unlocking\n right now.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(53, 52, 54, 1)),
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
}
