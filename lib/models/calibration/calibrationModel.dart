class CalibrationModel {
  final String image;
  final String data;
  final bool isLocked;

  CalibrationModel(
      {required this.image, required this.isLocked, required this.data});
}

List<CalibrationModel> demoLockData = [
  CalibrationModel(
      image: 'Front Doorasdaasdasdasdasdsd',
      isLocked: true,
      data: 'Zayed Home'),
  CalibrationModel(image: 'Back Door', isLocked: false, data: 'Zayed Home'),
  CalibrationModel(image: 'Garage', isLocked: true, data: 'Zayed Home'),
];
