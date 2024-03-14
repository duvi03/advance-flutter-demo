import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/daily_skin_screen/pages/routine_pages.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/daily_skin_screen/pages/streaks_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DailySkinCareDashBoardController extends GetxController {
  RxInt pageIndex = RxInt(0);

  RxList<Widget> pages = RxList([
    const RoutinePages(),
    const StreaksPages(),
  ]);

  RxList<DailySkinCareModel> dailySkinCareList = RxList([
    DailySkinCareModel(
      title: "Cleanser",
      description: "Cetaphil Gentle Skin Cleanser",
      time: "8:00 PM",
    ),
    DailySkinCareModel(
      title: "Toner",
      description: "Thayers Witch Hazel Toner",
      time: "8:02 PM",
    ),
    DailySkinCareModel(
      title: "Moisturizer",
      description: "Kiehl's Ultra Facial Cream",
      time: "8:04 PM",
    ),
    DailySkinCareModel(
      title: "Sunscreen",
      description: "Supergoop Unseen Sunscreen SPF 40",
      time: "8:06 PM",
    ),
    DailySkinCareModel(
      title: "Lip Balm",
      description: "Glossier Birthday Balm Dotcom",
      time: "8:08 PM",
    )
  ]);

  RxList<ChartData> chartData = RxList([
    ChartData(DateTime(2024, 03, 14), 23),
    ChartData(DateTime(2024, 03, 13), 40),
    ChartData(DateTime(2024, 03, 12), 50),
    ChartData(DateTime(2024, 03, 11), 27),
    ChartData(DateTime(2024, 03, 10), 25),
    ChartData(DateTime(2024, 03, 09), 23),
    ChartData(DateTime(2024, 03, 08), 23),
    ChartData(DateTime(2024, 03, 07), 20),
    ChartData(DateTime(2024, 03, 05), 21),
    ChartData(DateTime(2024, 03, 01), 22),
    ChartData(DateTime(2024, 02, 27), 12),
    ChartData(DateTime(2024, 02, 20), 20),
    ChartData(DateTime(2024, 02, 14), 30),
    ChartData(DateTime(2024, 02, 07), 20),
    ChartData(DateTime(2024, 01, 15), 60),
    ChartData(DateTime(2024, 01, 01), 60),
    ChartData(DateTime(2023, 12, 27), 53),
    ChartData(DateTime(2023, 12, 25), 43),
    ChartData(DateTime(2023, 12, 16), 41),
    ChartData(DateTime(2023, 09, 07), 45),
    ChartData(DateTime(2023, 08, 15), 22),
    ChartData(DateTime(2023, 07, 01), 10),
    ChartData(DateTime(2023, 06, 27), 11),
    ChartData(DateTime(2023, 05, 25), 50),
    ChartData(DateTime(2023, 03, 16), 20),
  ]);

  @override
  void onInit() async {
    super.onInit();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final DateTime x;
  final double? y;

  @override
  String toString() {
    return 'chartDate: ${DateFormat("dd-MM-yyyy").format(x)}, chartValue: $y}';
  }
}

class DailySkinCareModel {


  final String? title;
  final String? description;
  final String? time;

  DailySkinCareModel({this.title, this.description, this.time});
}