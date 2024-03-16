import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CalibrationSecondaryButton extends StatelessWidget {
  const CalibrationSecondaryButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.height,
    required this.width,
  });

  final String title;
  final VoidCallback onTap;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/Icons/arrow-left.svg',
              color: const Color.fromRGBO(229, 231, 235, 1),
            ),
            Text('Previous Step',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 16.sp,
                      color: const Color.fromRGBO(229, 231, 235, 1),
                      fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }
}
