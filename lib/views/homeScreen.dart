import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/customDrawer.dart';
import 'package:smart_lock_app/components/lockCard.dart';
import 'package:smart_lock_app/components/propertiesCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedValue = 'Locks';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          //

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState!.openEndDrawer();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 12.w,
                                    top: 41.h,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/Icons/notification.svg', // Path to Unlocked Bullet SVG
                                    width: 28.w,
                                    height: 28.h,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState!.openEndDrawer();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 8.w,
                                    top: 41.h,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/Icons/menuwhite.svg', // Path to Unlocked Bullet SVG
                                    width: 28.w,
                                    height: 28.h,
                                  ),
                                ),
                              ),
                            ],
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
              Container(
                height: 55.h,
                width: 130.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.06),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.white,
                  height: 55.h,
                  width: 110.w,
                  child: Column(
                    children: [
                      // SizedBox(height: 4.h),
                      DropdownButton<String>(
                        value: selectedValue,
                        icon: Padding(
                          padding: EdgeInsets.only(right: 10.w, left: 10.w),
                          child: SvgPicture.asset(
                            'assets/Icons/arrowDown.svg', // Path to Unlocked Bullet SVG
                            width: 10.w,
                            height: 6.h,
                          ),
                        ),
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: const Color.fromRGBO(
                                75,
                                85,
                                99,
                                1,
                              ),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: <String>['Locks', 'Properties']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(
                              // width: 150.w,
                              height: 72.h,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 7.w, top: 5.h, bottom: 5.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            color: const Color.fromRGBO(
                                                17, 24, 39, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                    // const Divider(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              if (selectedValue == 'Locks')
                Column(
                  children: [
                    const lockCard(
                      home: 'Fifth Settlement',
                      location: 'Front Door',
                      locked: true,
                    ),
                    SizedBox(height: 8.h),
                    const lockCard(
                      home: 'Zayed Home',
                      location: 'Front Door',
                      locked: true,
                    ),
                    SizedBox(height: 8.h),
                    const lockCard(
                      home: 'Fifth Settlement',
                      location: 'Back Door',
                      locked: false,
                    ),
                    SizedBox(height: 8.h),
                    const lockCard(
                      home: 'Fifth Settlement',
                      location: 'Back Door',
                      locked: false,
                    ),
                  ],
                ),
              if (selectedValue == 'Properties')
                Column(
                  children: [
                    const PropertiesCard(numberOfLockes: 3, homeName: 'Haram'),
                    SizedBox(height: 8.h),
                    const PropertiesCard(numberOfLockes: 1, homeName: 'Office'),
                    const PropertiesCard(numberOfLockes: 4, homeName: 'Zayed'),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
