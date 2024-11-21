// import 'package:flutter/material.dart';

abstract class SmartLockAppConstants {
  static const List<Map> calibration = [
    {
      'id': 1,
      'image': 'assets/Images/7 - door closed.gif',
      'body':
          "Let's calibrate your lock so the app knows how to use it with your door hardware",
    },
    {
      'id': 2,
      'image':
          'assets/Images/2 - unlocking all the way with the thumb turn.gif',
      'body':
          "Rotate your lock completely in the UNLOCK Direction, all the way until it stops. \n\nIf your thumbnuts also operates your latch then hold it in the unlatched position until next step.",
    },
    {
      'id': 3,
      'image': 'assets/Images/1 - locking all the way.gif',
      'body':
          "Rotate your lock completely in the LOCK Direction, all the way until it stops. \n\nHold it in this position until the next step. ",
    },
    {
      'id': 4,
      'image': 'assets/Images/4 - just locked.gif',
      'body':
          "Slowly turn the lock until the door is just unlocked, stopping after it clicks to unlock.",
    },
    {
      'id': 5,
      'image': 'assets/Images/5 - just unlocked.gif',
      'body':
          "Rotate the thumbnuts until the door is just locked.\n\nIf your lock has multiple locked position, just stop after the first position.",
    },
  ];
}
