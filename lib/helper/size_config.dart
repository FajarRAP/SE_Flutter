import 'package:flutter/material.dart';

class SizeConfig {
  static var _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.sizeOf(context);
    screenWidth = _mediaQueryData!.width;
    screenHeight = _mediaQueryData!.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}
