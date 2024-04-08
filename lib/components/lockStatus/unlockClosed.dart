import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/controller/cubits/lockCubit/lockCubit.dart';
import 'package:smart_lock_app/controller/lockConditions/actionClass.dart';

class UnlockClosed extends StatelessWidget {
  const UnlockClosed({super.key});

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
              Container(
                width: 239.0.w,
                height: 239.0.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromRGBO(6, 194, 112, 1),
                    width: 20.0.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 90.w, top: 90.h, left: 80.w, bottom: 75.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Unlocked',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                          color: const Color.fromRGBO(
                            143,
                            144,
                            166,
                            1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Closed',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17.sp,
                          color: const Color.fromRGBO(
                            143,
                            144,
                            166,
                            1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36.h,
        ),
        Text(
          'Press and hold to unlock',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(143, 144, 166, 1))),
        ),
      ],
    );
  }
}
