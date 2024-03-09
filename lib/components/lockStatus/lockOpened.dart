import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LockOpen extends StatelessWidget {
  const LockOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                width: 213.0,
                height: 213.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(212, 52, 81, 0.1),
                ),
              ),
              // SvgPicture.asset(
              //   'assets/Icons/transparentRedCircle.svg',
              //   height: 213.h,
              //   width: 213.w,
              // ),
              SvgPicture.asset(
                'assets/Icons/redCircleTriangles.svg',
                height: 236.h,
                width: 236.w,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 85.w, top: 90.h, left: 85.w, bottom: 75.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Locked',
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
          'Press and hold to unlock',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(143, 144, 166, 1))),
        ),
      ],
    );
  }
}
