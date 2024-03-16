import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/CustomAppBar.dart';
import 'package:smart_lock_app/components/buttons/calibrationPrimaryButton.dart';
import 'package:smart_lock_app/components/buttons/calibrationSecondaryButton.dart';
import 'package:smart_lock_app/constants/constants.dart';
import 'package:smart_lock_app/views/calibration/calibrationSuccessScreen.dart';

class CalibrationScreen extends StatefulWidget {
  const CalibrationScreen({super.key});

  @override
  State<CalibrationScreen> createState() => _CalibrationScreenState();
}

class _CalibrationScreenState extends State<CalibrationScreen> {
  int currentStepIndex = 0;

  void goToNextStep() {
    setState(() {
      if (currentStepIndex < SmartLockAppConstants.calibration.length - 1) {
        currentStepIndex++;
      } else if (currentStepIndex + 1 ==
          SmartLockAppConstants.calibration.length) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CalibrationSuccess(),
          ),
        );
      } else {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map currentStep = SmartLockAppConstants.calibration[currentStepIndex];
    int count = currentStepIndex + 1;

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
                      'assets/Images/calibration.png',
                      fit: BoxFit.cover,
                      width: 390.w,
                      height: 241.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              Row(
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
                          "7",
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
              ),
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
            Padding(
              padding: EdgeInsets.only(left: 18.w, bottom: 16.h, top: 90.h),
              child: CalibrationSecondaryButton(
                onTap: () {},
                title: 'Next Step',
                height: 42,
                width: 173,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.w, bottom: 16.h, top: 90.h),
              child: CalibrationPrimaryButton(
                onTap: () {
                  goToNextStep();
                  print(currentStepIndex + 1);
                  // print(count);
                  print(SmartLockAppConstants.calibration.length);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
