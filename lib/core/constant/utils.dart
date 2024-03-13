import 'package:demo/core/z_file_core.dart';
import 'package:intl/intl.dart';


class Utils {
  ///getting date to return and set to the text view  date {toady yesterday}
  String getCurrentDate(String date) {
    final now = DateTime.now();
    String string = date;
    final splitted = string.split(' ');

    DateTime getDate = DateTime.parse(splitted[0].split('/').reversed.join());
    DateTime today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (getDate == today) {
      return "Today";
    } else if (getDate == yesterday) {
      return "Yesterday";
    } else {
      return splitted[0];
    }
  }

  /// getting the time and set to the text view
  String getTime(String date) {
    String string = date;
    final splitted = string.split(' ');
    return "${splitted[1]} ${splitted[2]}";
  }

  /// Tue, April 19, 2022 06:37 PM (isUTC=false)
  String formatDateTime(
      {int time = 0,

        ///To enable UTC Time
        bool isUTC = false,

        /// Specify whether you want date only,timeonly or datetime
        /// Eg: FormatDateTimeType.DATETIME || FormatDateTimeType.TIMEONLY || FormatDateTimeType.DATEONLY
        FormatDateTimeType? type = FormatDateTimeType.DATETIME,

        ///Specify different date format if you want to use
        String dateFormat = DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY,

        ///Specify different time format if you want to use
        String timeFormat = DateFormat.HOUR_MINUTE}) {
    try {
      String parsedTime;
      if (time > 0) {
        parsedTime = type == FormatDateTimeType.TIMEONLY
            ? timeOnlyFormat(time: time, isUTC: isUTC, timeFormat: timeFormat)
            : type == FormatDateTimeType.DATEONLY
            ? dateOnlyFormat(
            time: time, isUTC: isUTC, dateFormat: dateFormat)
            : dateTimeFormat(
            time: time,
            isUTC: isUTC,
            dateFormat: dateFormat,
            timeFormat: timeFormat);
        return parsedTime;
      } else {
        return " -- ";
      }
    } catch (e) {
      print(e);
      return '--';
    }
  }

  String dateOnlyFormat(
      {required int time, bool isUTC = false, required String dateFormat}) {
    return DateFormat(dateFormat)
        .format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC))
        .toString();
  }

  String timeOnlyFormat(
      {required int time, bool isUTC = false, required String timeFormat}) {
    return DateFormat(timeFormat)
        .format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC))
        .toString();
  }

  String dateTimeFormat(
      {required int time,
        bool isUTC = false,
        required String dateFormat,
        required String timeFormat}) {
    return '${DateFormat(dateFormat).format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC)).toString()} ${DateFormat(timeFormat).format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC)).toString()}';
  }

  ///getting date to show date {toady yesterday} in conditions
  String getDate(String date) {
    String string = date;
    final splitted = string.split(' ');
    return splitted[0];
  }


}