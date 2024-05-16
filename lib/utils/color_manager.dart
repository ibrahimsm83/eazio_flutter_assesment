import 'package:flutter/material.dart';

class ColorManager {
  static Color kPrimary= const Color(0xff1E5BD7);
  static Color kWhiteColor = Colors.white;
  static Color kBlackColor = Colors.black;
  static Color kRedColor = Colors.red;
  static Color kGreenColor = Colors.green;
  static Color kGreyColor = const Color(0xffB5B5C3);
  static Color kOrangeColor = const Color(0xffFD6C6C);
  static Color kYellowColor = const Color(0xffFFC107);
  static Color kgreenColor = const Color(0xff28BF5B);
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