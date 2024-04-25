import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessCalibrateButton extends StatelessWidget {
  const SuccessCalibrateButton({
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
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Center(
          child: Text(title,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: const Color.fromRGBO(37, 36, 37, 1),
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
