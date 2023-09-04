import 'dart:io' show Platform;

// android = false means the platform is most likely iOS
bool android = false;

void getPlatform() {
  if (Platform.isAndroid) {
    android = true;
  } else {
    android = false;
  }
}

double getAppbarHeight() {
  getPlatform();
  return android ? 60 : 65;
}

double getResultHeight() {
  getPlatform();
  return android ? 135 : 205;
}

double getOperatorButtonSize({bool mini = false}) {
  getPlatform();
  if (mini) {
    return 60; // WAS android 60, iOS 65. Changed for better text fit.
  }
  return android ? 75 : 80;
}

double getNumButtonSize() {
  getPlatform();
  return 80; // WAS android 80, iOS 85. Changed for better text fit.
}

double getMainAxisSpacing(double screenHeight) {
  // 896, 844, 805, 890
  if (screenHeight >= 815) {
    return 5;
  }
  // 761, 781, 812
  else if (700 <= screenHeight && screenHeight < 815) {
    return 1;
  }
  // 667
  else {
    return 0;
  }
}

double getCrossAxisSpacing(double screenHeight) {
  if (android) {
    // 805, 890
    if (screenHeight >= 815) {
      return 5;
    }
    // 761, 781
    else if (700 <= screenHeight && screenHeight < 815) {
      return 13;
    }
    // random
    else {
      return 5;
    }
  }
  // iOS
  else {
    // 896
    if (screenHeight >= 850) {
      return 5;
    }
    // 844
    else if (820 <= screenHeight && screenHeight < 850) {
      return 13;
    }
    // 812
    else if (800 <= screenHeight && screenHeight < 820) {
      return 10;
    }
    // 667
    else {
      return 17;
    }
  }
}
