import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_lock_app/views/locksScreen.dart';

class PropertiesCard extends StatelessWidget {
  const PropertiesCard({
    super.key,
    required this.numberOfLockes,
    required this.homeName,
  });

  final int numberOfLockes;
  final String homeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LocksScreen(
                      home: homeName,
                    )));
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 344.w, // Set your maximum width
        ),
        height: 111.h,
        width: 344.w,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(
                  0, 1, 2, 0.06), // You can customize the shadow color
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1), // Changes the position of the shadow
            ),
            BoxShadow(
              color: Color.fromRGBO(
                  0, 1, 3, 0.1), // You can customize the shadow color
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 1), // Changes the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Container(
          color: Colors.white,
          height: 100.h,
          width: 310.w,
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
                          'assets/Images/propertiesImage.png',
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
                            top: 40.h,
                          ),
                          child: Text(
                            homeName,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: const Color.fromRGBO(55, 65, 81, 1),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          '$numberOfLockes Locks',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: const Color.fromRGBO(156, 163, 175, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
