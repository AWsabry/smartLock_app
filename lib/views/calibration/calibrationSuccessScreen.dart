import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/buttons/successCalibrateButton.dart';
import 'package:smart_lock_app/models/location/locationModel.dart';
import 'package:smart_lock_app/models/locks/lockModel.dart';
import 'package:smart_lock_app/views/mainScreens/homeScreen.dart';

class CalibrationSuccess extends StatelessWidget {
  const CalibrationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 102.h,
            ),
            Center(
              child: Image.asset('assets/Images/DoneImage.png'),
            ),
            SizedBox(
              height: 11.h,
            ),
            Text(
              "Congratulations",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            ),
            SizedBox(
              height: 13.h,
            ),
            AutoSizeText(
              "Your lock has been calibrated successfully.",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            ),
            SizedBox(
              height: 5.h,
            ),
            AutoSizeText(
              "You can now use your smart lock with ease.",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            ),
            SizedBox(
              height: 192.h,
            ),
            SuccessCalibrateButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          lockData: demoLockData,
                          locationData: demoLocationData,
                        ),
                      ));
                },
                title: 'Go to HomePage',
                height: 42,
                width: 350)
          ],
        ),
      ),
    );
  }
}
