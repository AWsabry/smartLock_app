import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/CustomAppBar.dart';
import 'package:smart_lock_app/components/buttons/primaryButton.dart';

class CalibrationSuccess extends StatelessWidget {
  const CalibrationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Calibrate Your Lock'),
        body: Column(
          children: [
            SizedBox(
              height: 163.h,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 95.h,
                    width: 95.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.r),
                        ),
                        color: const Color.fromRGBO(209, 250, 229, 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: SvgPicture.asset(
                      'assets/Icons/tickGreen.svg',
                      width: 14.w,
                      height: 14.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text('Your lock has been successfully calibrated',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromRGBO(85, 87, 112, 1),
                        fontWeight: FontWeight.w500),
                  )),
            ),
            SizedBox(
              height: 192.h,
            ),
            PrimaryButton(onTap: () {}, title: 'Done', height: 42, width: 350)
          ],
        ),
      ),
    );
  }
}
