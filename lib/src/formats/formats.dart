import 'package:intl/intl.dart';

abstract class DateFormats {
  static DateFormat dateFormatDay = DateFormat('d/M');
  static DateFormat dateFormatHour = DateFormat('HH:mm');
  static DateFormat dateFormatMonth = DateFormat('d/M/yy');

  static String formatPostDate(DateTime dateTime) {
    if (DateTime.now().difference(dateTime).inDays < 1) {
      return dateFormatHour.format(dateTime);
    } else if (DateTime.now().difference(dateTime).inDays < 30 ||
        DateTime.now().difference(dateTime).inDays < 31) {
      return dateFormatDay.format(dateTime);
    }
    return dateFormatMonth.format(dateTime);
  }
}
