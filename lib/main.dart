import 'package:btc_chart/presentation/app_colors.dart';
import 'package:btc_chart/presentation/app_themes.dart';
import 'package:btc_chart/ui/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTC Chart',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppThemes.appBar,
        elevatedButtonTheme: AppThemes.elevatedButton,
      ),
      home: const HomePage(),
    );
  }
}
