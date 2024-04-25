class LockModel {
  final String name;
  final String location;
  final bool isLocked;

  LockModel(
      {required this.name, required this.isLocked, required this.location});
}

List<LockModel> demoLockData = [
  LockModel(name: 'Front Door', isLocked: true, location: 'Sherif Home'),
];
