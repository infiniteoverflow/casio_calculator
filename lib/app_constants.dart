import 'package:flutter/material.dart';

enum KeyTypes {
  action,
  operator,
  digit,
}

class KColors {
  static final actionColor = Colors.blue[300];
  static const operatorColor = Colors.orange;
  static const primaryColor = Colors.black;
}

class CalculatorKeys {
  static List calculatorKeys = [
    ['AC', KColors.actionColor, KeyTypes.action],
    ['+/-', KColors.actionColor, KeyTypes.action],
    ['%', KColors.actionColor, KeyTypes.action],
    ['/', KColors.operatorColor, KeyTypes.operator],
    ['7', KColors.primaryColor, KeyTypes.digit],
    ['8', KColors.primaryColor, KeyTypes.digit],
    ['9', KColors.primaryColor, KeyTypes.digit],
    ['x', KColors.operatorColor, KeyTypes.operator],
    ['4', KColors.primaryColor, KeyTypes.digit],
    ['5', KColors.primaryColor, KeyTypes.digit],
    ['6', KColors.primaryColor, KeyTypes.digit],
    ['-', KColors.operatorColor, KeyTypes.operator],
    ['1', KColors.primaryColor, KeyTypes.digit],
    ['2', KColors.primaryColor, KeyTypes.digit],
    ['3', KColors.primaryColor, KeyTypes.digit],
    ['+', KColors.operatorColor, KeyTypes.operator],
    ['0', KColors.primaryColor, KeyTypes.digit],
    ['.', KColors.primaryColor, KeyTypes.digit],
    ['=', KColors.operatorColor, KeyTypes.operator],
  ];
}
