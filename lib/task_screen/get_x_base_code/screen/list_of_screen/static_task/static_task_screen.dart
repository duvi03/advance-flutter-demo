import 'package:demo/core/common/common_function.dart';
import 'package:demo/core/constant/z_file_constant.dart';
import 'package:demo/task_screen/get_x_base_code/controller/news_static_controller.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/daily_skin_screen/daily_skin_care_dashboard_screen.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/donut_app_screen/donut_home_screen.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/modern_smart_home_ui/home_page.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/news_screen/news_setting_screen.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/news_screen/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaticTaskScreen extends StatelessWidget {
  const StaticTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets.customTextView(text: "Static UI Task"),
      ),
      body: Container(
        color: Colors.grey.shade100.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    children: [
                      commonCardItem(
                        onTap: () {
                          Get.to(() => const NewSettingScreen());
                        },
                        text: "News Settings Screen",
                      ),
                      commonCardItem(
                        onTap: () {
                          Get.to(() => const DailySkinCareDashboardScreen());
                        },
                        text: "Daily Skin Care Screen",
                      ),
                      commonCardItem(
                        onTap: () {
                          Get.to(() => const ModernSmartHomePage());
                        },
                        text: "Modern Smart Home Screen",
                      ),
                      commonCardItem(
                        onTap: () {
                          Get.to(() => const DonutHomePage());
                        },
                        text: "Donut App Screen",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  commonCardItem({VoidCallback? onTap, required String text}) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap ?? () {},
        splashColor: Colors.grey.shade50,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonWidgets.customTextView(
              text: text,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
