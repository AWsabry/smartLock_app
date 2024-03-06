import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_lock_app/theme.dart';
import 'package:smart_lock_app/views/landingScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        title: 'Smart Lock',
        theme: MyTheme.lightTheme,
        home: const LandingScreen(),
      ),
    );
  }
}
