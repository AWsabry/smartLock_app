import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LockDisconnected extends StatelessWidget {
  const LockDisconnected({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/Icons/Ellipse-grey.svg',
            height: 231.h,
            width: 231.w,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: 58.w, top: 103.h, left: 58, bottom: 102.h),
          child: Text(
            'Disconnected',
            textAlign: TextAlign.left,
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17.sp,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
