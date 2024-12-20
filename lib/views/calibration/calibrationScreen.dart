import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/CustomAppBar.dart';
import 'package:smart_lock_app/components/buttons/calibrationPrimaryButton.dart';
import 'package:smart_lock_app/components/buttons/calibrationSecondaryButton.dart';
import 'package:smart_lock_app/constants/constants.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockCubit.dart';
import 'package:smart_lock_app/views/calibration/calibrationLoadingScreen.dart';

class CalibrationScreen extends StatefulWidget {
  const CalibrationScreen({super.key});

  @override
  State<CalibrationScreen> createState() => _CalibrationScreenState();
}

class _CalibrationScreenState extends State<CalibrationScreen> {
  int currentStepIndex = 0;

  void goToNextStep() {
    LockCubit cubit = BlocProvider.of<LockCubit>(context);
    setState(() {
      if (currentStepIndex < SmartLockAppConstants.calibration.length) {
        print("current Step$currentStepIndex");
        if (currentStepIndex == 1) {
          cubit.startCalibration(context);
          print("Calibration Started");
        } else if (currentStepIndex == 2) {
          print("Calibration CULP");
          cubit.lockingMechanismCalibration(context, data: 3);
        } else if (currentStepIndex == 3) {
          print("Calibration CLP");

          cubit.lockingMechanismCalibration(context, data: 2);
        } else if (currentStepIndex == 4) {
          print("Calibration JULP");

          cubit.lockingMechanismCalibration(context, data: 5);
        }
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    Map currentStep = SmartLockAppConstants.calibration[currentStepIndex];
    int count = currentStepIndex;
    log(count.toString());
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Calibrate Your Lock'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'Follow Steps To Calibrate Lock',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(55, 65, 81, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Padding(
                padding: EdgeInsets.only(left: 18.w, right: 16.w),
                child: Container(
                  width: 356.w,
                  height: 231.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(85, 87, 112, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Image.asset(
                      currentStep['image'],
                      fit: BoxFit.cover,
                      width: 390.w,
                      height: 241.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              count != 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Step',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(156, 163, 175, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 6.w,
                            left: 8.w,
                          ),
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  4.r), // Adjust the radius as needed

                              color: const Color.fromRGBO(
                                31,
                                41,
                                55,
                                1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 2.h,
                              ),
                              child: Text(
                                "$count",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "/",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(156, 163, 175, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 6.w,
                          ),
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r), //
                                color: const Color.fromRGBO(240, 249, 255, 1)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 2.h,
                              ),
                              child: Text(
                                "4",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(31, 41, 55, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(height: 28.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 29.w),
                child: Text(
                  currentStep['body'],
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(85, 87, 112, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentStepIndex == 0
                ? Padding(
                    padding: EdgeInsets.only(
                        right: 16.w, bottom: 16.h, top: 90.h, left: 16.w),
                    child: CalibrationPrimaryButton(
                      text: "Let's Start",
                      onTap: () {
                        currentStepIndex++;

                        goToNextStep();
                        // print(count);
                        print(SmartLockAppConstants.calibration.length);
                      },
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        right: 16.w,
                        bottom: 16.h,
                        top: 90.h,
                        left: currentStepIndex < 4 ? 181.w : 172.w),
                    child: CalibrationSecondaryButton(
                      width: currentStepIndex < 4 ? 193 : 202,
                      text: currentStepIndex < 4
                          ? "Done, go to next"
                          : "Done with All Steps",
                      onTap: () {
                        currentStepIndex++;

                        if (currentStepIndex < 5) {
                          print(currentStepIndex);
                          goToNextStep();
                        } else {
                          BlocProvider.of<LockCubit>(context)
                              .lockingMechanismCalibration(context, data: 4)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CalibrationLoadingScreen(),
                                ));
                          });
                        }
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
