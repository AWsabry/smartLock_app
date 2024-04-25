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
    homeName: 'Sherif Home',
    locks: {
      'Front Door': demoLockData[0],
    },
    numberOfLockes: demoLockData.length,
  ),
];
