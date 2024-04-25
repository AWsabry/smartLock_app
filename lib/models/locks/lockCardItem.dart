import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/models/locks/lockModel.dart';
// import 'package:smart_lock_app/splashScreen.dart';
import 'package:smart_lock_app/views/lockDetails/lockAndUnlock.dart';

class LockCardItem extends StatelessWidget {
  const LockCardItem({
    super.key,
    required this.lock,
  });

  final LockModel lock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LockAndUnlock(),
            ));
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 344.w, // Set your maximum width
        ),
        height: 111.h,
        width: 344.w,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 1, 2, 0.06),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 1, 3, 0.1),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Container(
          height: 110.h,
          width: 322.w,
          color: Colors.white,
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
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 200.w, // Set your maximum width
                            ),
                            child: AutoSizeText(
                              lock.location,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: const Color.fromRGBO(107, 114, 128, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 200.w, // Set your maximum width
                          ),
                          child: AutoSizeText(
                            maxLines: 1,
                            lock.name,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: const Color.fromRGBO(55, 65, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Stick to the bottom right corner
              Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 24.h,
                    right: 20.w,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        lock.isLocked
                            ? 'assets/Icons/Bullet.svg'
                            : 'assets/Icons/redBullet.svg',
                        width: 8.w,
                        height: 8.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        lock.isLocked ? 'Unlocked' : 'Locked',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: lock.isLocked
                                ? const Color.fromRGBO(16, 185, 129, 1)
                                : const Color.fromRGBO(185, 28, 28, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
