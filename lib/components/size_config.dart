import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = new MediaQueryData();
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockWidth = 0.0;
  static double blockHeight = 0.0;
  static double blockHeightB = 0.0;
  static double blockHeightC = 0.0;
  static double screenRatio = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    // print(screenHeight);
    // print(screenWidth);
    // print(screenHeight / screenWidth);
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
    blockHeightB =
        screenHeight / 100; // smaller blockHeight with increase in screenHeight
    blockHeightC =
        screenHeight / 101; // larger blockHeight with increase in screenHeight
    screenRatio = screenHeight / screenWidth;
    if (screenHeight / screenWidth >= 1.7 && screenHeight / screenWidth < 1.8) {
      blockHeightB = screenHeight / 110;
      blockHeightC = screenHeight / 97;
    } else if (screenHeight / screenWidth >= 1.8 &&
        screenHeight / screenWidth < 1.9) {
      blockHeightB = screenHeight / 114;
      blockHeightC = screenHeight / 97;
    } else if (screenHeight / screenWidth >= 1.9 &&
        screenHeight / screenWidth < 2) {
      blockHeightB = screenHeight / 116;
      blockHeightC = screenHeight / 97;
    } else if (screenHeight / screenWidth >= 2 &&
        screenHeight / screenWidth < 2.1) {
      screenRatio = screenRatio * 0.9;
      blockHeightB = screenHeight / 118;
      blockHeightC = screenHeight / 97;
    } else if (screenHeight / screenWidth >= 2.1) {
      screenRatio = screenRatio * 0.85;
      blockHeightB = screenHeight / 120;
      blockHeightC = screenHeight / 97;
    }
  }
}
