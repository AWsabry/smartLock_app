import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class lockCard extends StatelessWidget {
  const lockCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 111.h,
      width: 344.w,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(
                0, 1, 2, 0.06), // You can customize the shadow color
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 1), // Changes the position of the shadow
          ),
          BoxShadow(
            color: Color.fromRGBO(
                0, 1, 3, 0.1), // You can customize the shadow color
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 1), // Changes the position of the shadow
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 6.h, bottom: 11.h),
            child: Container(
              width: 78.w,
              height: 78.h,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(99, 102, 241, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                child: Image.asset(
                  'assets/Images/lockDemo.png',
                  fit: BoxFit.cover,
                  width: 78.w,
                  height: 78.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
