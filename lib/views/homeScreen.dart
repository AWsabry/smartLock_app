import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/lockCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 390.w,
                  height: 167.h,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(31, 41, 55, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w, top: 41.h),
                          child: Container(
                            width: 34.w,
                            height: 34.h,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(31, 41, 55, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: Image.asset(
                                'assets/Images/profileDemo.png',
                                fit: BoxFit.cover,
                                width: 390.w,
                                height: 241.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Folan',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp,
                                        color: Colors.white)),
                              ),
                              Text(
                                'Welcome to your Smart Command Center.',
                                style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 14.h),
            const lockCard()
          ],
        ),
      ),
    );
  }
}
