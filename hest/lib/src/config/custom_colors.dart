import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(250, 74, 0, .1),
  100: const Color.fromRGBO(250, 74, 12, .2),
  200: const Color.fromRGBO(250, 74, 12, .3),
  300: const Color.fromRGBO(250, 74, 12, .4),
  400: const Color.fromRGBO(250, 74, 12, .5),
  500: const Color.fromRGBO(250, 74, 12, .6),
  600: const Color.fromRGBO(250, 74, 12, .7),
  700: const Color.fromRGBO(250, 74, 12, .8),
  800: const Color.fromRGBO(250, 74, 12, .9),
  900: const Color.fromRGBO(250, 74, 12, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.blue.shade900;

  static MaterialColor customSwatchColor =
      MaterialColor(0xFFFA4A0C, _swatchOpacity);
}
