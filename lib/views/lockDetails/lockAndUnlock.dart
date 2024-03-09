import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/lockStatus/lockClosed.dart';
import 'package:smart_lock_app/components/lockStatus/lockOpened.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockCubit.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockStates.dart';

class LockAndUnlock extends StatefulWidget {
  const LockAndUnlock({super.key});

  @override
  State<LockAndUnlock> createState() => _LockAndUnlockState();
}

class _LockAndUnlockState extends State<LockAndUnlock> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LockCubit, LockStates>(builder: (context, state) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 25.h,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/Icons/arrow-left.svg',
                                    color: Colors.white,
                                    height: 24.h,
                                    width: 24.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5.w,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    'Back',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w, top: 25.h),
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/Icons/setting-2.svg',
                              color: Colors.white,
                              height: 24.h,
                              width: 24.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 34.w, top: 23.h),
                          child: Container(
                            width: 63.35.w,
                            height: 65.09.h,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(31, 41, 55, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7.r),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: Image.asset(
                                'assets/Images/lockImage.png',
                                fit: BoxFit.cover,
                                width: 63.35.w,
                                height: 65.09.h,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 19.w, top: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Front Door',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp,
                                        color: Colors.white)),
                              ),
                              Text(
                                'Zayed Home',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.sp,
                                        color: Colors.white)),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                '68 Ismail Serry ',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 16.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/Icons/wifi-grey.svg',
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SvgPicture.asset(
                    'assets/Icons/bluetooth-grey.svg',
                    height: 16.13.h,
                    width: 11.18.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            BlocProvider.of<LockCubit>(context).isLocked == true
                ? const LockClosed()
                : const LockOpen(),

            Text(BlocProvider.of<LockCubit>(context).isLocked.toString())
            // Center(
            //   child: BlocBuilder<LockCubit, LockStates>(
            //     builder: (context, state) {
            //       String lockStatus = (state is Locked) ? 'Locked' : 'Unlocked';
            //       return Text(
            //         'Lock Status: $lockStatus',
            //         style: const TextStyle(fontSize: 24),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // BlocProvider.of<LockCubit>(context).toggleLock();
        //   },
        //   child: const Icon(Icons.lock),
        // ),
      ));
    });
  }
}
