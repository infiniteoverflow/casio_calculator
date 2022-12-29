import 'package:flutter/material.dart';

class KColors {
  static final actionColor = Colors.blue[300];
  static const operatorColor = Colors.orange;
  static const primaryColor = Colors.black;
}

class CalculatorKeys {
  static List calculatorKeys = [
    ['AC', KColors.actionColor],
    ['+/-', KColors.actionColor],
    ['%', KColors.actionColor],
    ['/', KColors.operatorColor],
    ['7', KColors.primaryColor],
    ['8', KColors.primaryColor],
    ['9', KColors.primaryColor],
    ['x', KColors.operatorColor],
    ['4', KColors.primaryColor],
    ['5', KColors.primaryColor],
    ['6', KColors.primaryColor],
    ['-', KColors.operatorColor],
    ['1', KColors.primaryColor],
    ['2', KColors.primaryColor],
    ['3', KColors.primaryColor],
    ['+', KColors.operatorColor],
    ['0', KColors.primaryColor],
    ['-', KColors.primaryColor],
    ['=', KColors.operatorColor],
  ];
}