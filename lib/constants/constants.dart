// import 'package:flutter/material.dart';

abstract class SmartLockAppConstants {
  static const String applicationName = "MoApp";
  static const String applicationImage = "assets/Images/logo.png";
  static const List onBoardingImages = [
    'assets/Images/OnBoarding1.png',
    'assets/Images/OnBoarding2.png',
    'assets/Images/OnBoarding3.png'
  ];
  static const List onBoardingTitle = [
    "Welcome to FitzApp",
    "Workout Categories",
    "Custom Workouts"
  ];
  static const String haveAnAccount = "Already Have an account?";
  static const String dontHaveAnAccount = "Don't have an account?";
  static const String signUp = "Sign Up";

  static const List<Map> calibration = [
    {
      'id': 1,
      'body':
          "Let's calibrate your lock so the app knows how to use it with your door hardware.",
    },
    {
      'id': 2,
      'body':
          "Rotate your lock completely in the UNLOCK Direction, all the way until it stops. \n\nIf your thumbnuts also operates your latch then hold it in the unlatched position until next step.",
    },
    {
      'id': 3,
      'body':
          "Rotate your lock completely in the LOCK Direction, all the way until it stops. \n\nHold it in this position until the next step. ",
    },
    {
      'id': 4,
      'body':
          "Slowly turn the lock until the door is just unlocked, stopping after it clicks to unlock.",
    },
    {
      'id': 5,
      'body':
          "Rotate the thumbnuts until the door is just locked.\n\nIf your lock has multiple locked position, just stop after the first position.",
    },
    {
      'id': 6,
      'body':
          "Keep the door slightly ajar (just enough so that the lock or latch is more in the door frame)",
    },
    {
      'id': 7,
      'body': "Now close the door.",
    },
  ];
}
