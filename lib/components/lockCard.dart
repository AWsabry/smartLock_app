import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class lockCard extends StatelessWidget {
  const lockCard(
      {super.key,
      required this.locked,
      required this.home,
      required this.location});

  final bool locked;
  final String home;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 344.w, // Set your maximum width
      ),
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
            padding: EdgeInsets.only(left: 15.w, top: 9.h, bottom: 11.h),
            child: Row(
              children: [
                Container(
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
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                      ),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        home,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: const Color.fromRGBO(107, 114, 128, 1),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      location,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: const Color.fromRGBO(55, 65, 81, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 43.w,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 45.h,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        locked
                            ? 'assets/Icons/Bullet.svg' // Path to Unlocked Bullet SVG
                            : 'assets/Icons/redBullet.svg', // Path to Locked Bullet SVG
                        width: 8.w,
                        height: 8.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        locked ? 'Unlocked' : 'Locked',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: locked
                                ? const Color.fromRGBO(
                                    16, 185, 129, 1) // Unlocked color
                                : const Color.fromRGBO(
                                    185, 28, 28, 1), // Locked color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
