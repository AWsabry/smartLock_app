import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CalibrationPrimaryButton extends StatelessWidget {
  const CalibrationPrimaryButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.h,
        width: 173.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          color: Color.fromRGBO(31, 41, 55, 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 32.w,
              ),
              child: Text('Next Step',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 10.w),
              child: SvgPicture.asset(
                'assets/Icons/arrow-right.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
