// States
abstract class LockStates {}

class SuperLockStates extends LockStates {}

class Locked extends LockStates {
  final int value;
  Locked(this.value);
}

class Unlocked extends LockStates {
  final int value;
  Unlocked(this.value);
}
