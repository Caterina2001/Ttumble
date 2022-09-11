import 'package:flutter/material.dart';

class AppColor {
  /* static Color primary = Color(0xFF094542);
  static Color primarySoft = Color(0xFF0B5551); */
  static Color primary = Color(/* 0xfff96302 */ 0xFFF86302);
  static Color primarySoft = Color(0xfffc741a);
  static Color primaryExtraSoft = Color(0xFFEEF4F4);
  static Color secondary = Color(0xFFEDE5CC);
  static Color whiteSoft = Color(0xFFF8F8F8);
  static LinearGradient bottomShadow = LinearGradient(colors: [
    Color(0xFFF86302).withOpacity(0.2),
    Color(0xFFF86302).withOpacity(0)
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static LinearGradient linearBlackBottom = LinearGradient(
      colors: [Colors.black.withOpacity(0.45), Colors.black.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackTop = LinearGradient(
      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}
