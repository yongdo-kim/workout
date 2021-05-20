import 'package:intl/intl.dart';

class DateTimeFormatHelper {

  static String convertToMM(DateTime date) {
    return DateFormat("MM").format(date);
  }

  static String convertToYYYYY(DateTime date) {
    return DateFormat("yyyy").format(date);
  }

  //ex) 2020-08-03  10:21:22
  static String convertTomdHm(DateTime date) {
    return DateFormat("MM월 dd일 HH시 mm분").format(date);
  }

  static String convertToHmAmPmColon(DateTime date) {
    var dateTime = DateFormat("HH : mm").format(date);
    return dateTime;
  }
}
