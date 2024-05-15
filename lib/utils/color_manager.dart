import 'package:flutter/material.dart';

class ColorManager {
  static Color kLightBlueColor1 = const Color(0xff2F579A);
  static Color kWhiteColor = Colors.white;
  static Color kBlackColor = Colors.black;
  static Color kRedColor = Colors.red;
  static Color kGreyColor = const Color(0xffB5B5C3);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}