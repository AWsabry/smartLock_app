import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.fieldTitle});
  final String fieldTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 123.w),
          child: Text(
            fieldTitle,
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
          padding:
              EdgeInsets.only(top: 4.h, left: 15.w, bottom: 16.w, right: 15.w),
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
      ],
    );
  }
}
