import 'package:intl/intl.dart';

String getDate(String date) {
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  return formattedDate;
}
