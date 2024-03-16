import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleCubit.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleStates.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockCubit.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockStates.dart';

class LockAndUnlock extends StatefulWidget {
  const LockAndUnlock({super.key});

  @override
  State<LockAndUnlock> createState() => _LockAndUnlockState();
}

class _LockAndUnlockState extends State<LockAndUnlock> {
  bool isLoading = false;
  final flutterBle = FlutterReactiveBle();

  @override
  // initState() {
  //   BleStates state;
  //   final ble = BlocProvider.of<BleCubit>(context);

  //   super.initState();
  //   ble.requestLocationPermission();
  //   ble.scanSub =
  //       flutterBle.scanForDevices(withServices: []).listen(ble.scanForDevice);
  //   if (BlocProvider.of<LockCubit>(context).bleCubit.isConnected == true) {
  //     BlocProvider.of<LockCubit>(context).batteryValues();
  //   } else {
  //     print('asd');
  //     // BlocProvider.of<LockCubit>(context).batteryValues();
  //   }
  // }

  @override
  void dispose() {
    final ble = BlocProvider.of<BleCubit>(context);
    ble.notifySub?.cancel();
    ble.connectSub?.cancel();
    ble.scanSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BleCubit, BleStates>(builder: (ctx, state) {
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
      LockCubit cubit = BlocProvider.of<LockCubit>(context);

      return SafeArea(
          child: Scaffold(
        key: scaffoldKey,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 390.w,
                  height: 167.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(31, 41, 55, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r),
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
                mainAxisAlignment: state is BleConnectionFailed
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.spaceBetween,
                children: [
                  if (BleCubit.get(context).isConnected == true)
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/Icons/battery-blue.svg',
                            height: 24.h,
                            width: 24.w,
                          ),
                          Text(
                            cubit.batteryValue.toString(),
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 10.sp,
                                color: const Color.fromRGBO(30, 64, 175, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 38.w,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 200.w,
                    ),
                    child: SvgPicture.asset(
                      BleCubit.get(context).isConnected == false
                          ? 'assets/Icons/wifi-grey.svg'
                          : 'assets/Icons/wifi-blue.svg',
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SvgPicture.asset(
                    BleCubit.get(context).isConnected == false
                        ? 'assets/Icons/bluetooth-grey.svg'
                        : 'assets/Icons/bluetooth.svg',
                    height: 16.13.h,
                    width: 11.18.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            FutureBuilder(
                future: BlocProvider.of<LockCubit>(context)
                    .lockStateCharacteristics(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return snapshot.data ??
                        const Text('No Data'); // Handle null case if needed
                  }
                })

            // GestureDetector(
            //   onLongPress: () {
            //     if (state is ScanningDevice) {
            //       Logger().i("Still Scanning");
            //     } else {
            //       // Read The battery Values
            //       // BlocProvider.of<LockCubit>(context).batteryValues();
            //       // // Lock and Unlock
            //       // BlocProvider.of<LockCubit>(context).lockControl(data: '2');
            //       // // Check if the door is opened
            //       // BlocProvider.of<LockCubit>(context).isOpen();
            //       // Load the lockStateCharacteristics
            //       // BlocProvider.of<LockCubit>(context)
            //       //     .lockStateCharacteristics();

            //       print(cubit.isDoorOpen);
            //       print(cubit.bleCubit.isConnected);
            //     }
            //     // _toggleLockState();
            //   },
            //   // child: isLoading ? const Loading() : lockWidget),
            //   child: const LockClosed(),
            //   // Text(BlocProvider.of<LockCubit>(context).isLocked.toString()),
            //   // Text(cubit.batteryValue.toString()),
            //   // Text(BlocProvider.of<LockCubit>(context)
            //   //     .bleCubit
            //   //     .isConnected
            //   //     .toString()
            // )
          ],
        ),
      ));
    });
  }
}
