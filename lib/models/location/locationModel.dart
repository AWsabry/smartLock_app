import '../locks/lockModel.dart';

class LocationModel {
  final String homeName;
  final Map<String, LockModel> locks;
  final int numberOfLockes;

  LocationModel({
    required this.homeName,
    required this.locks,
    required this.numberOfLockes,
  });
}

List<LocationModel> demoLocationData = [
  LocationModel(
    homeName: 'Zayed Home',
    locks: {
      'Front Door': demoLockData[0],
      'Back Door': demoLockData[1],
      'Garage': demoLockData[2],
    },
    numberOfLockes: demoLockData.length,
  ),
];
