import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/controller/cubits/bleCubit/bleCubit.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockCubit.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockStates.dart';

class BatteryBleRead extends StatefulWidget {
  const BatteryBleRead({super.key});

  @override
  State<BatteryBleRead> createState() => _BatteryBleReadState();
}

class _BatteryBleReadState extends State<BatteryBleRead> {
  @override
  Widget build(BuildContext context) {
    LockCubit cubit = BlocProvider.of<LockCubit>(context);
    return BlocBuilder<LockCubit, LockStates>(builder: (ctx, state) {
      return Padding(
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
      );
    });
  }
}
