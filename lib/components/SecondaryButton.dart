import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.onTap, required this.title});

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 360.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(209, 213, 219, 1)),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                color: const Color.fromRGBO(55, 65, 81, 1),
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
