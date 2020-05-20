import 'package:intl/intl.dart';

class Utils {
  static String convertDateFromString(
      String dateToConvert, String formatString) {
    DateTime convertedDate = DateTime.parse(dateToConvert);
    var formatter = new DateFormat(formatString);
    return formatter.format(convertedDate);
  }
}
