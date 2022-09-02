import 'package:flutter/material.dart';

import 'Input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff111428)),
          scaffoldBackgroundColor: Color(0xff111428),
      ),
      home: InputPage(),
    );
  }
}
