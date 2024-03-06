import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/components/appBar.dart';
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
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 123.w),
              child: Text(
                'Enter your email or phone number',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  color: const Color.fromRGBO(107, 114, 128, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 4.h, left: 15.w, bottom: 16.w, right: 15.w),
              child: SizedBox(
                height: 42.h,
                child: TextFormField(
                  cursorColor: Colors.black,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(209, 213, 219, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the active color to black
                      ),
                    ),

                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // Add any other InputDecoration properties as needed
                  ),
                  // Other TextFormField properties go here
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 215.w),
              child: Text(
                'Enter your password',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  color: const Color.fromRGBO(107, 114, 128, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 4.h, left: 15.w, bottom: 16.w, right: 15.w),
              child: SizedBox(
                height: 42.h,
                child: TextFormField(
                  cursorColor: Colors.black,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(209, 213, 219, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the active color to black
                      ),
                    ),

                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // Add any other InputDecoration properties as needed
                  ),
                  // Other TextFormField properties go here
                ),
              ),
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
