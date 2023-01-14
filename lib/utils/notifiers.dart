import 'package:flutter/cupertino.dart';

/// Contains Notifiers that does various actions of the Calculator.
class Notifiers {
  /// This notifier is used to update the current value on the
  /// calculator display.
  static final ValueNotifier screenDisplayNotifier = ValueNotifier('');

  /// This notifier is used to show the history of operations done
  /// by the user.
  static ValueNotifier<List<String>> historyDisplayNotifier = ValueNotifier([]);
}
