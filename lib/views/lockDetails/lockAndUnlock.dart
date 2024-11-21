import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/batteryBleWifiRead.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder<BleCubit, BleStates>(builder: (context, state) {
      Future.wait([
        BleCubit.get(context).requestBluetoothPermission(context: context),
      ]);
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
                                'Sherif Home',
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
            const BatteryBleRead(),
            SizedBox(
              height: 64.h,
            ),
            state is SuccessFullyFoundDevice
                ? Stack(
                    children: [
                      Container(
                        width: 239.0.w,
                        height: 239.0.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromRGBO(228, 228, 235, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(228, 228, 235, 1),
                            width: 20.0.w,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Connecting",
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp,
                                color: const Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : state is SuperBleStates
                    ? const Center(child: CircularProgressIndicator())
                    : state is FailedToConnect
                        ? Stack(
                            children: [
                              Container(
                                width: 239.0.w,
                                height: 239.0.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromRGBO(228, 228, 235, 1),
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(228, 228, 235, 1),
                                    width: 20.0.w,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Disconnected",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17.sp,
                                        color: const Color.fromRGBO(
                                          255,
                                          255,
                                          255,
                                          1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : BlocBuilder<LockCubit, LockStates>(
                            builder: (context, state) {
                            return FutureBuilder(
                                future: BlocProvider.of<LockCubit>(context)
                                    .renderLockAndUnlockWidgets(context),
                                builder:
                                    (context, AsyncSnapshot<Widget> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    if (snapshot.hasError) {
                                      // Show error message
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      // Show the widget returned by the future
                                      return snapshot.data ??
                                          const Text('No Data');
                                    }
                                  }
                                });
                          })
          ],
        ),
      ));
    });
  }
}
