import 'package:casio_calculator/app_constants.dart';
import 'package:casio_calculator/custom_button.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 140,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(
                      left: 6,
                      right: 16,
                    ),
                    child: CustomButton(
                      width: MediaQuery.of(context).size.width,
                      borderRadius: 0.0,
                      shadowOffset: const Offset(10, 10),
                      borderWidth: 6,
                      child: Column(
                        children: [
                          const Spacer(),
                          Container(
                            height: 10,
                            color: KColors.actionColor?.withOpacity(0.5),
                          ),
                          Container(
                            height: 10,
                            color: KColors.operatorColor.withOpacity(0.5),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: List.generate(
                CalculatorKeys.calculatorKeys.length,
                (index) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: index == 16 ? 2 : 1,
                    mainAxisCellCount: 1,
                    child: CustomButton(
                      child: Center(
                        child: Text(
                          CalculatorKeys.calculatorKeys[index][0],
                          style: GoogleFonts.bungee(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: CalculatorKeys.calculatorKeys[index][1],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
