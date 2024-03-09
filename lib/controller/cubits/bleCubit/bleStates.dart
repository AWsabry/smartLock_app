abstract class BleStates {}

class SuperBleStates extends BleStates {}

// scanForDevice Function States
class SuccessFullyFoundDevice extends BleStates {}

class FailedToFindDevice extends BleStates {}

// connectDevice Function States
class SuccessFullyConnected extends BleStates {}

class FailedToConnect extends BleStates {}

// readDataFromBle Function States

class SuccessReadData extends BleStates {}

class FailedReadData extends BleStates {}

// writeDataToBle Function States

class SuccessToWriteData extends BleStates {}

class FailedToWriteData extends BleStates {}
