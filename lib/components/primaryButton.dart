import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onTap, required this.title});

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 360.w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Color.fromRGBO(31, 41, 55, 1),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(title,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
