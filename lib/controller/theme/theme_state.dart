import 'package:flutter/material.dart';

abstract class ThemeState {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final Color bgColor;
  final Color borderColor;
  final Color whiteColor;
  final Color btnTextColor;
  final double defaultBorderRadius;
  final TextStyle headingStyle;
  final TextStyle paragraphStyle;

  const ThemeState({
    this.primaryColor = const Color(0xff506C83),
    this.secondaryColor = const Color(0xff192229),
    this.textColor = const Color(0xff181A1D),
    this.bgColor = Colors.white,
    this.borderColor = const Color.fromARGB(94, 80, 108, 131),
    this.whiteColor = Colors.white,
    this.btnTextColor = Colors.white,
    this.headingStyle = const TextStyle(color: Color(0xff181A1D), fontSize: 42, fontWeight: FontWeight.w900),
    this.paragraphStyle = const TextStyle(color: Color.fromARGB(180, 24, 26, 29), fontSize: 14, fontWeight: FontWeight.w400),
    this.defaultBorderRadius = 8,
  });
}

class DarkMode extends ThemeState {
  const DarkMode()
      : super(
          primaryColor: const Color(0xff506C83),
          secondaryColor: const Color(0xff192229),
          textColor: Colors.white,
          bgColor: const Color(0xff192229),
          borderColor: const Color.fromARGB(94, 80, 108, 131),
          btnTextColor: const Color(0xff192229),
          headingStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 42, fontWeight: FontWeight.w900),
          paragraphStyle: const TextStyle(color: Color.fromARGB(255, 186, 186, 186), fontSize: 14, fontWeight: FontWeight.w400),
        );
}

class LightMode extends ThemeState {
  const LightMode()
      : super(
          primaryColor: const Color(0xff506C83),
          secondaryColor: const Color(0xff192229),
          textColor: const Color(0xff181A1D),
          bgColor: Colors.white,
          borderColor: const Color.fromARGB(94, 80, 108, 131),
          btnTextColor: Colors.white,
          headingStyle: const TextStyle(color: Color(0xff181A1D), fontSize: 42, fontWeight: FontWeight.w900),
          paragraphStyle: const TextStyle(color: Color.fromARGB(180, 24, 26, 29), fontSize: 14, fontWeight: FontWeight.w400),
        );
}
