import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/appBar.dart';
import 'package:smart_lock_app/components/customTextFormField.dart';
import 'package:smart_lock_app/components/primaryButton.dart';
import 'package:smart_lock_app/views/homeScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Log into My Account'),
      body: Padding(
        padding: EdgeInsets.only(top: 33.h),
        child: Column(
          children: [
            SizedBox(
              height: 33.h,
            ),
            const CustomTextFormField(
              fieldTitle: 'Enter your email or phone number',
            ),
            SizedBox(
              height: 16.h,
            ),
            const CustomTextFormField(
              fieldTitle: 'Enter your password',
            ),
            SizedBox(
              height: 47.h,
            ),
            GestureDetector(
              child: Text(
                'Forgot my password',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(
                      55,
                      65,
                      81,
                      1,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 80.h,
            ),
            PrimaryButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                title: 'Log in')
          ],
        ),
      ),
    );
  }
}
