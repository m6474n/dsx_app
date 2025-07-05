import 'package:flutter/material.dart';

abstract class ThemeState {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final Color bgColor;
  final Color borderColor;

  const ThemeState({
     this.primaryColor =  const Color(0xff506C83),
     this.secondaryColor = const Color(0xff192229),
     this.textColor=const Color(0xff181A1D),
     this.bgColor =Colors.white,
     this.borderColor=const Color.fromARGB(94, 80, 108, 131),
  });
}

class DarkMode extends ThemeState {
  const DarkMode()
      : super(
          primaryColor: const Color(0xff506C83),
          secondaryColor:const Color(0xff192229),
          textColor: Colors.white,
          bgColor: const Color(0xff192229),
          borderColor:const Color.fromARGB(94, 80, 108, 131),
        );
}

class LightMode extends ThemeState {
  const LightMode()
      : super(
          primaryColor: const Color(0xff506C83),
          secondaryColor:const Color(0xff192229),
          textColor: const Color(0xff181A1D),
          bgColor:  Colors.white,
          borderColor:const Color.fromARGB(94, 80, 108, 131),
        );
}
