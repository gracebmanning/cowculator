import 'dart:io' show Platform;

// android = false means the platform is most likely iOS
bool android = false;

void getPlatform() {
  if (Platform.isAndroid) {
    android = true;
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

double getOperatorButtonSize() {
  getPlatform();
  return android ? 80 : 85;
}

double getNumButtonSize() {
  getPlatform();
  return android ? 85 : 90;
}

double getCalculatorHeight(double screenHeight) {
  // Pixel 6 screen height: 898
  if (800 < screenHeight && screenHeight < 1000) {
    return screenHeight * 0.58;
  }
  // iPhone 8 height: 736
  else if (700 < screenHeight && screenHeight <= 800) {
    return screenHeight * 0.67;
  } else {
    return screenHeight * 0.7;
  }
}

double getCalculatorPadding(double screenHeight) {
  // Pixel 6 & iPhone 12 screen height: ~ 898
  if (900 < screenHeight && screenHeight < 1000) {
    return screenHeight * 0.09;
  } else if (800 < screenHeight && screenHeight <= 900) {
    return screenHeight * 0.07;
  } else {
    return screenHeight * 0.04;
  }
}

double getMainAxisSpacing(double screenHeight) {
  // Pixel 6 & iPhone 12 screen height: ~ 898
  if (900 < screenHeight && screenHeight < 1000) {
    return screenHeight * 0.025;
  } else if (800 < screenHeight && screenHeight <= 900) {
    return screenHeight * 0.023;
  } else {
    return screenHeight * 0.01;
  }
}
