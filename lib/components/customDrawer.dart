import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270.w,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 40.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 17.w,
                  right: 8.w,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/Icons/menu.svg', // Path to Unlocked Bullet SVG
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              Text(
                'Menu',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: const Color.fromRGBO(75, 85, 99, 1))),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 136.w,
                  right: 16.w,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/Icons/close-square.svg', // Path to Unlocked Bullet SVG
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 42.h,
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/Icons/homeGrey.svg', // Path to Unlocked Bullet SVG
              width: 24.w,
              height: 24.h,
            ),
            title: Text(
              'Home',
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(
                    17,
                    24,
                    39,
                    1,
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/Icons/profile-circle.svg', // Path to Unlocked Bullet SVG
              width: 24.w,
              height: 24.h,
            ),
            title: Text(
              'Profile',
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(
                    17,
                    24,
                    39,
                    1,
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/Icons/setting-2.svg', // Path to Unlocked Bullet SVG
              width: 24.w,
              height: 24.h,
            ),
            title: Text(
              'Settings',
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(
                    17,
                    24,
                    39,
                    1,
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/Icons/add-square.svg', // Path to Unlocked Bullet SVG
              width: 24.w,
              height: 24.h,
            ),
            title: Text(
              'Add New Device',
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(
                    17,
                    24,
                    39,
                    1,
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/Icons/heart.svg', // Path to Unlocked Bullet SVG
              width: 24.w,
              height: 24.h,
            ),
            title: Text(
              'Favorite Locks',
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color.fromRGBO(
                    17,
                    24,
                    39,
                    1,
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
