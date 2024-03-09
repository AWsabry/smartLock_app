import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.h,
      child: BottomNavigationBar(
        selectedFontSize: 12.sp,
        selectedItemColor: const Color.fromRGBO(30, 64, 175, 1),
        currentIndex: currentIndex,
        onTap: onTabSelected,
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(
                bottom: 8.h,
              ),
              child: SvgPicture.asset(
                'assets/Icons/lockBlue.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
            icon: SvgPicture.asset(
              'assets/Icons/lockGrey.svg',
              width: 20.w,
              height: 20.h,
            ),
            label: 'Lock/Unlock',
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(
                bottom: 8.h,
              ),
              child: SvgPicture.asset(
                'assets/Icons/activityblue.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
            icon: SvgPicture.asset(
              'assets/Icons/activityGrey.svg',
              width: 20.w,
              height: 20.h,
            ),
            label: 'Activity Log',
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(
                bottom: 8.h,
              ),
              child: SvgPicture.asset(
                'assets/Icons/profile-circle-blue.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
            icon: SvgPicture.asset(
              'assets/Icons/profile-circle.svg',
              width: 20.w,
              height: 20.h,
            ),
            label: 'Guests',
          ),
        ],
      ),
    );
  }
}
