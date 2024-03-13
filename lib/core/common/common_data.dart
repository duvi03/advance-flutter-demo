import 'package:demo/core/constant/z_file_constant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonData {
  static RxMap<String, dynamic> getDefaultCountry() {
    return countries.firstWhere((element) => element["name"] == "Canada").obs;
  }

  static String? getCountryCodeByName(String countryName) {
    return countries
        .firstWhereOrNull((element) => element["name"] == countryName)?["code"];
  }

  static String? getCountryNameByCode(String code) {
    return countries
        .firstWhereOrNull((element) => element["code"] == code)?["name"];
  }

  static List<String> getAllCountryList() {
    return countries.map((e) => e["name"].toString()).toList();
  }

  static String checkNullSafeString(String? data) {
    return data ?? "-";
  }

  static String checkNullSafeWithPrice(String? data) {
    return data == null
        ? "-"
        : data.isEmpty
        ? "-"
        : "$data";
  }

  static String timeAgoCustom(DateTime d) {             // <-- Custom method Time Show  (Display Example  ==> 'Today 7:00 PM')     // WhatsApp Time Show Status Shimila
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return DateFormat.E().add_jm().format(d);
    }
    if (diff.inHours > 0) {
      return "Today ${DateFormat('jm').format(d)}";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "just now";
  }
}
