import 'package:intl/intl.dart';

extension DataType on double {
  String toCurrency() {
    final formatter = NumberFormat.currency(symbol: '', decimalDigits: 2);
    return formatter.format(this);
  }
}
