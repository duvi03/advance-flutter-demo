import 'dart:core';
import 'package:demo/core/z_file_core.dart';
import 'package:intl/intl.dart';

/// Convert time from milliseconds into Proper date time.
///
///
/// Eg. String example= formatDateTime(time:1650371850674)
///
/// Console.debug(example)
///
/// Tue,Jan 20, 1970 7:56 AM  (Default)
///
/// Tue, April 19, 2022 12:37 PM (isUTC=true)
///
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
          ? dateOnlyFormat(time: time, isUTC: isUTC, dateFormat: dateFormat)
          : dateTimeFormat(time: time, isUTC: isUTC, dateFormat: dateFormat, timeFormat: timeFormat);
      return parsedTime;
    } else {
      return " -- ";
    }
  } catch (e) {
    Console.debug(e);
    return '--';
  }
}
// DateFormat('yMd')

String dateOnlyFormat({required int time, bool isUTC = false, required String dateFormat}) {
  return DateFormat(dateFormat).format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC)).toString();
}

String timeOnlyFormat({required int time, bool isUTC = false, required String timeFormat}) {
  return DateFormat(timeFormat).format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC)).toString();
}

String dateTimeFormat({required int time, bool isUTC = false, required String dateFormat, required String timeFormat}) {
  return '${DateFormat(dateFormat).format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC)).toString()} ${DateFormat(timeFormat).format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC)).toString()}';
}
// String currencyFormat({dynamic value, String? symbol, String? locale = "en_US", int decimalDigits = 0, bool isCompactCurrency = false}) {
//   try {
//     final format = isCompactCurrency ? NumberFormat.compactCurrency(locale: locale, symbol: symbol, decimalDigits: decimalDigits) : NumberFormat.currency(locale: locale, symbol: symbol, decimalDigits: decimalDigits);
//
//     return format.format(safeParseNum(value).round());
//   } catch (e) {
//     Console.debug(e);
//     return '0.0';
//   }
// }
/// A number format for compact currency representations, e.g. "$1.2M" instead of "$1,200,000".
String currencyFormat({dynamic value, String? symbol, String? locale = "en_US", int decimalDigits = 0, bool isCompactCurrency = false,bool isReturnRoundValue = true}) {
  try {
    final format = isCompactCurrency
        ? NumberFormat.compactCurrency(locale: locale, symbol: symbol, decimalDigits: decimalDigits)
        : NumberFormat.currency(locale: locale, symbol: symbol, decimalDigits: decimalDigits);

    return format.format(isReturnRoundValue ? safeParseNum(value).round() : safeParseNum(value));
  } catch (e) {
    Console.debug(e);
    return '0.0';
  }
}

double safeParseDouble(dynamic value) {
  try {
    return double.parse((value as dynamic).toString());
  } on FormatException {
    return 0.0;
  } catch (e) {
    Console.debug(e);
    return 0.0;
  }
}

int safeParseInt(dynamic value) {
  try {
    return int.parse((value as dynamic).toString());
  } catch (e) {
    return 0;
  }
}

num safeParseNum(dynamic value) {
  try {
    return num.parse((value as dynamic).toString());
  } catch (e) {
    return 0;
  }
}

String convertTimeIntoSeconds(DateTime time) {
  try {
    return (time.toUtc().millisecondsSinceEpoch / 1000.0).round().toString();
  } catch (e) {
    return '';
  }
}


