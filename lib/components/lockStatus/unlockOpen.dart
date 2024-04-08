import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UnlockOpen extends StatelessWidget {
  const UnlockOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/Icons/circleGreenDots.svg',
                height: 217.h,
                width: 217.w,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 70.w, top: 90.h, left: 70.w, bottom: 75.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Unlocked',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                          color: const Color.fromRGBO(
                            143,
                            144,
                            166,
                            1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Open',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17.sp,
                          color: const Color.fromRGBO(
                            143,
                            144,
                            166,
                            1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36.h,
        ),
        Text(
          'Close Door to Use Lock',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(6, 194, 112, 1))),
        ),
      ],
    );
  }
}
