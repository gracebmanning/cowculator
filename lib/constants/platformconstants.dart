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

double getMainAxisSpacing(double screenHeight, double screenWidth) {
  if (screenWidth > 600) {
    return 0;
  } else {
    if (screenHeight < 750) {
      return 0; // 667, 736
    } else if (screenHeight < 815) {
      return 1; // 761, 781, 812
    } else {
      return 5; // 896, 844, 805, 890
    }
  }
}

double getCrossAxisSpacing(double screenHeight, double screenWidth) {
  getPlatform();
  if (screenWidth > 600) {
    if (android) {
      return 65;
    } else {
      return 85;
    }
  } else {
    if (android) {
      if (screenHeight < 800) {
        return 13; // 761, 781
      } else {
        return 5; // 805, 890
      }
    }
    // iOS
    else {
      if (screenHeight < 750) {
        return 17; // 667, 736
      } else if (screenHeight < 820) {
        return 10; // 812
      } else if (screenHeight < 850) {
        return 13; // 844
      } else {
        return 5; // 896
      }
    }
  }
}

double getSizedBoxHeight(double screenHeight) {
  if (screenHeight < 750) {
    return 120;
  } else if (screenHeight < 900) {
    return 130;
  } else {
    getPlatform();
    if (android) {
      if (screenHeight < 1000) {
        return 190;
      } else {
        return 210;
      }
    } else {
      return 190;
    }
  }
}

double getTopPadding(double screenHeight) {
  if (screenHeight < 700) {
    return 0;
  } else if (screenHeight < 800) {
    return 5;
  } else if (screenHeight < 1000) {
    return 10;
  } else {
    return 0;
  }
}

double getMiniMainAxisSpacing(double screenHeight) {
  if (screenHeight < 750) {
    return 0.5;
  } else if (screenHeight < 1000) {
    return 9;
  } else {
    return 0.5;
  }
}

double getMiniCrossAxisSpacing(screenHeight) {
  if (screenHeight < 1000) {
    return 0;
  } else {
    return 30;
  }
}

double getResultBoxPadding(double screenHeight) {
  if (screenHeight < 770) {
    return 10;
  } else {
    return 20;
  }
}

double getMiniButtonSize(double screenHeight) {
  if (screenHeight > 1000) {
    return 75;
  } else {
    getPlatform();
    if (android) {
      return 60;
    } else {
      if (screenHeight < 815) {
        return 55;
      } else {
        return 60;
      }
    }
  }
}

double getOperatorButtonSize(double screenHeight) {
  if (screenHeight > 1000) {
    return 95;
  } else {
    getPlatform();
    if (android) {
      return 75;
    } else {
      if (screenHeight < 700) {
        return 70;
      } else if (screenHeight < 820) {
        return 75;
      } else {
        return 80;
      }
    }
  }
}

double getNumButtonSize(double screenHeight) {
  if (screenHeight > 1000) {
    return 95;
  } else {
    if (android) {
      return 80;
    } else {
      if (screenHeight < 700) {
        return 70;
      } else if (screenHeight < 820) {
        return 75;
      } else {
        return 80;
      }
    }
  }
}
