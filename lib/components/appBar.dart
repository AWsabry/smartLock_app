import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56.h,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(
                  0, 0, 0, 0.05), // You can customize the shadow color
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1), // Changes the position of the shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 16.h, left: 16.w, bottom: 16.w, right: 16.w),
              child: SvgPicture.asset(
                'assets/Icons/arrow-left.svg',
              ),
            ),
            Text(title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: const Color.fromRGBO(
                      55,
                      65,
                      81,
                      1,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
