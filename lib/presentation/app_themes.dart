import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {
  static const appBar = AppBarTheme(
    titleTextStyle: AppTextStyles.appBarTitle,
    backgroundColor: AppColors.white,
    elevation: 0.0,
  );

  static var elevatedButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      textStyle: MaterialStateProperty.all(AppTextStyles.reg16),
      foregroundColor: MaterialStateProperty.all(AppColors.white),
      backgroundColor: MaterialStateProperty.all(AppColors.blue),
    ),
  );
}
