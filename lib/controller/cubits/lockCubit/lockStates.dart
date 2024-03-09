// States
abstract class LockStates {}

class SuperLockStates extends LockStates {}

class LockedSuccessfully extends LockStates {}

class UnlockedSuccessfully extends LockStates {}

class ConnectionFailed extends LockStates {}

class DoorIsOpen extends LockStates {}

class DoorIsClosed extends LockStates {}
