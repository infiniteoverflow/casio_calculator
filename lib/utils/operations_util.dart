class OperationUtil {
  static String total(List<String> history) {
    String result = '';
    int a = 0;
    int b = 0;
    String operator = '';

    for (String item in history) {
      int operand = int.tryParse(item) ?? -1;

      if (operand == -1) {
        operator = item;
      } else {
        if (operator != '') {
          b = operand;

          switch (operator) {
            case '/':
              result = (a ~/ b).toString();
              a = (a ~/ b);
              break;
            case 'x':
              result = (a * b).toInt().toString();
              a = (a * b).toInt();
              break;
            case '-':
              result = (a - b).toInt().toString();
              a = (a - b).toInt();
              break;
            case '+':
              result = (a + b).toInt().toString();
              a = (a + b).toInt();
              break;
            default:
              break;
          }
        } else {
          a = operand;
        }
      }
    }

    return result;
  }
}
