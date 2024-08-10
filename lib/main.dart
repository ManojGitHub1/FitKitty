// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   // ThemeData docs
      //   // primaryColor: Colors.red,
      //   // 0xFF=opacity, 0A=Red, 0E=Green, 21=Blue
      //   // //Color(#0A0E21)
      //   primaryColor: Color(0xFF0A0E21),
      //   appBarTheme: AppBarTheme(
      //     color:  Color(0xFF0A0E21),
      //   ),
      //   // textTheme: TextTheme(
      //   //   bodySmall: TextStyle(color: Colors.white),
      //   // ),
      //   // or we can use ThemeData.dark by default changes to white
      //   scaffoldBackgroundColor:  Color(0xFF0A0E21),
      // ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
            color:  Color(0xFF0A0E15),
        ),
      ),
      home: InputPage(),
    );
  }
}

