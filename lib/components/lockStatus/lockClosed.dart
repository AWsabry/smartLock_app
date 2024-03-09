import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LockClosed extends StatelessWidget {
  const LockClosed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(
              'assets/Icons/redCircleOutline.svg',
              height: 231.h,
              width: 231.w,
            ),
            Padding(
              padding: EdgeInsets.all(14.1.r),
              child: SvgPicture.asset(
                'assets/Icons/redCircleSolid.svg',
                height: 202.8.h,
                width: 202.8.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: 85.w, top: 90.h, left: 85.w, bottom: 75.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Locked',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17.sp,
                            color: Colors.white)),
                  ),
                  Text(
                    'Closed',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
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
