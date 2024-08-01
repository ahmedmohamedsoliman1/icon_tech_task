import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class AppTheming {

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.whiteColor ,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400 ,
        color: AppColors.blackColor
      )
    )
  );
}