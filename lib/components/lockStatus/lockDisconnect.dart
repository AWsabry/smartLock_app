import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockCubit.dart';
import 'package:smart_lock_app/controller/lockConditions/actionClass.dart';

class LockDisconnected extends StatelessWidget {
  const LockDisconnected({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () async {
            final lockActions =
                LockActions(BlocProvider.of<LockCubit>(context));
            await lockActions.lockAction(
              context,
            );
          },
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/Icons/Ellipse-grey.svg',
                  height: 231.h,
                  width: 231.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 58.w, top: 103.h, left: 58, bottom: 102.h),
                child: Text(
                  'Disconnected',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36.h,
        ),
        Padding(
          padding: EdgeInsets.only(right: 58.w, left: 58),
          child: Text(
            'Please make sure you are connected to the device via Bluetooth, or that the device is connected to the internet.',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: const Color.fromRGBO(143, 144, 166, 1))),
          ),
        ),
      ],
    );
  }
}
