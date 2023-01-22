import 'package:intl/intl.dart';

String formatDataToString(
  DateTime data, {
  String format = 'dd/MM/yyyy HH:MM',
  String input = 'yyyy-MM-dd HH:mm:ss',
}) {
  final formatter = DateFormat(format, 'pt_BR');
  final inputFormatter = DateFormat(input, 'pt_BR');
  final date = inputFormatter.parse(data.toString());
  return formatter.format(date);
}
