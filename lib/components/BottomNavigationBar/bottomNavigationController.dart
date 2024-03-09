import 'package:flutter/material.dart';
import 'package:smart_lock_app/components/BottomNavigationBar/customBottomNavigationBar.dart';
import 'package:smart_lock_app/views/lockDetails/activityLog.dart';
import 'package:smart_lock_app/views/lockDetails/guests.dart';
import 'package:smart_lock_app/views/lockDetails/lockAndUnlock.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  _NavigationControllerState createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          LockAndUnlock(),
          ActivityLogScreen(),
          GuestScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
