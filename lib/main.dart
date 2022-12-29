import 'package:casio_calculator/app_constants.dart';
import 'package:casio_calculator/custom_button.dart';
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
                SizedBox(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(
                      top: 80,
                      left: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CASIO',
                              style: GoogleFonts.michroma(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 5.0,
                                height: 0.5,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 2.0, top: 2.0),
                              child: Text(
                                'CALCULATOR',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              4,
                              (index) => const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: CustomButton(
                                  height: 25,
                                  width: 25,
                                  borderRadius: 0,
                                  shadowOffset: Offset(2, 2),
                                  borderWidth: 2.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(
                      left: 8,
                      right: 16,
                    ),
                    child: CustomButton(
                      width: MediaQuery.of(context).size.width,
                      borderRadius: 0.0,
                      shadowOffset: const Offset(8, 8),
                      borderWidth: 6,
                      child: Column(
                        children: [
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ValueListenableBuilder(
                                valueListenable: Notifiers.mainDigitsNotifier,
                                builder: (context, value, _) {
                                  String digits = value.toString();

                                  return Text(
                                    value.toString(),
                                    style: GoogleFonts.bungee(
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold,
                                      color: digits == '0'
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
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
                  height: 18,
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
                      buttonValue: CalculatorKeys.calculatorKeys[index][0],
                      buttonType: CalculatorKeys.calculatorKeys[index][2],
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
