import 'dart:io' show Platform;

bool android = false;
bool ios = false;

void getPlatform(){
  if(Platform.isAndroid){
    android = true;
  }
  else if(Platform.isIOS){
    ios = true;
  }
}

double getAppbarHeight(){
  return android ? 60 : 65;
}

double getResultHeight(){
  return android ? 150 : 205;
}

double getResultFontSize(){
  return android ? 40 : 45;
}

double getOperatorButtonSize(){
  return android ? 80 : 85;
}

double getNumButtonSize(){
  return android ? 85 : 90;
}




// either return different builds of the pages or set variables to specific values
// ex: change padding values, change heights of boxes, etc.
// set numbers to be more relative rather than hard-coded