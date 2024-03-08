import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/lockCard.dart';

class LocksScreen extends StatelessWidget {
  const LocksScreen({super.key, required this.home});
  final String home;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 85.h,
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
              child: Container(
                color: Colors.white,
                height: 80.h,
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 25.h, left: 10.w, bottom: 32.h),
                      child: SvgPicture.asset(
                        'assets/Icons/arrow-left.svg',
                        height: 24.h,
                        width: 24.h,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 25.h, left: 5.w, bottom: 32.h),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        'Back',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: const Color.fromRGBO(31, 41, 55, 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 25.h, left: 67.w, bottom: 32.h),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        'Zayed Home',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: const Color.fromRGBO(55, 65, 81, 1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // const Divider(),
            SizedBox(
              height: 17.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 22.w,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(
                              209, 213, 219, 1), // Border color
                          width: 1.0, // Border width
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0,
                                0.05), // You can customize the shadow color
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: Offset(
                                0, 1), // Changes the position of the shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.r),
                        ),
                      ),
                      child: Container(
                        height: 22.h,
                        width: 88.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 8.6.h, left: 11.w, bottom: 8.6.h),
                              child: SvgPicture.asset(
                                'assets/Icons/lockBlack.svg',
                                height: 12.8.h,
                                width: 11.2.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 6.h, left: 8.w, bottom: 7.h),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                'Lock All',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: const Color.fromRGBO(31, 41, 55, 1),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            lockCard(locked: true, home: home, location: home),
            SizedBox(
              height: 16.h,
            ),
            lockCard(locked: true, home: home, location: home),
            SizedBox(
              height: 16.h,
            ),
            lockCard(locked: true, home: home, location: home),
          ],
        ),
      ),
    );
  }
}
