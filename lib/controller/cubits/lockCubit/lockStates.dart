// States
abstract class LockStates {}

class SuperLockStates extends LockStates {}

class LockedSuccessfully extends LockStates {}

class UnlockedSuccessfully extends LockStates {}

class BleConnectionFailed extends LockStates {}

class DoorIsOpen extends LockStates {}

class DoorIsClosed extends LockStates {}

// Battery States
class SuperBatteryStates extends LockStates {}

class SuccessReadBatteryValues extends LockStates {}

class FailedToReadBatteryValues extends LockStates {}

class Connecting extends LockStates {}
