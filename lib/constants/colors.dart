import 'package:flutter/material.dart';

class ColorModifier {
  Color light;
  Color dark;

  ColorModifier({required this.light, required this.dark});

  Color getColor(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode ? dark : light;
  }
}

class AppColorScheme {
  AppColorScheme._();

  static ColorModifier background = ColorModifier(
    light: const Color(0xFFF9F9F9),
    dark: const Color(0xFF181818),
  );
  static ColorModifier foreground = ColorModifier(
    light: const Color(0xFF262931),
    dark: const Color(0xFFFFFFFF),
  );
  static ColorModifier primary = ColorModifier(
    light: const Color(0xFF4A55A7),
    dark: const Color(0xFF6371DE),
  );
  static ColorModifier success = ColorModifier(
    light: const Color(0xFF17CF97),
    dark: const Color(0xFF17CF97),
  );

  static ColorModifier error = ColorModifier(
    light: const Color(0xFFC6142C),
    dark: const Color(0xFFEB182C),
  );
  static ColorModifier secondary = ColorModifier(
    light: const Color(0xFFBFDBFE),
    dark: const Color(0xFF1E293B),
  );
  static ColorModifier royalBlue = ColorModifier(
    light: const Color(0xFF1A5CFF),
    dark: const Color(0xFFFFFFFF),
  );
}
