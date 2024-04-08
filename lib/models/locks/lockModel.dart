class LockModel {
  final String name;
  final String location;
  final bool isLocked;

  LockModel(
      {required this.name, required this.isLocked, required this.location});
}

List<LockModel> demoLockData = [
  LockModel(
      name: 'Front Doorasdaasdasdasdasdsd',
      isLocked: true,
      location: 'Zayed Home'),
  LockModel(name: 'Back Door', isLocked: false, location: 'Zayed Home'),
  LockModel(name: 'Garage', isLocked: true, location: 'Zayed Home'),
];
