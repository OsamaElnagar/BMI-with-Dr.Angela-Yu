import 'package:angela_bmi_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';

import 'layout/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kInactiveCardColor,
        ),
      ),
    );
  }
}

