import 'package:flutter/material.dart';
import 'package:paxride/theme/colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    // background: Colors.grey.shade100,
    secondary: Colors.black,
    surface: AppColors.backgroundColor,
    onPrimaryContainer: Colors.grey.shade50,
    onSecondaryContainer: const Color.fromARGB(255, 246, 247, 248),
    primaryContainer: const Color.fromRGBO(95, 93, 93, 0.024),
    secondaryContainer: const Color.fromRGBO(85, 85, 105, 0.024),
    primary: const Color.fromARGB(108, 55, 54, 54),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    // background: Colors.black,
    surface: AppColors.blackColor950,
    secondary: Colors.grey.shade100,
    onPrimaryContainer: Colors.grey.shade900,
    onSecondaryContainer: const Color.fromARGB(255, 41, 40, 40),
    secondaryContainer: const Color.fromRGBO(103, 95, 95, 0.024),
    primary: const Color.fromARGB(255, 170, 170, 170),
  ),
);
