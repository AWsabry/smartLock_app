// States
abstract class LockStates {}

class SuperLockStates extends LockStates {}

class LockedSuccessfully extends LockStates {}

class UnlockedSuccessfully extends LockStates {}

class BleConnectionFailed extends LockStates {}

class DoorIsOpen extends LockStates {}

class DoorIsClosed extends LockStates {}

class SuccessReadBatteryValues extends LockStates {}

class FailedToReadBatteryValues extends LockStates {}

class ReadTheLockStateCharacteristicsSuccessfully extends LockStates {}

class FailedToReadTheLockStateCharacteristics extends LockStates {}

class WriteSuccessfully extends LockStates {}

class WriteFailed extends LockStates {}
