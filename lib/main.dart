import 'package:casio_calculator/app_constants.dart';
import 'package:casio_calculator/canvas.dart';
import 'package:casio_calculator/components/custom_button.dart';
import 'package:casio_calculator/components/calculator_page.dart';
import 'package:casio_calculator/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}