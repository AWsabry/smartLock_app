import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CalibrationSecondaryButton extends StatelessWidget {
  const CalibrationSecondaryButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.width,
  });

  final VoidCallback onTap;
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            const Radius.circular(6).r,
          ),
          color: const Color.fromRGBO(31, 41, 55, 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
              ),
              child: Text(text,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: width == 193 ? 16.w : 7.w),
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
