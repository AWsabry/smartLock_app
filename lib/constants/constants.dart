// import 'package:flutter/material.dart';

abstract class SmartLockAppConstants {
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
      'body': "Loading.",
    },
  ];
}
