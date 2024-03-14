import 'package:demo/core/z_file_core.dart';
import 'package:demo/task_screen/get_x_base_code/controller/daily_skincare_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailySkinCareDashboardScreen extends StatelessWidget {
  const DailySkinCareDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DailySkinCareDashBoardController>(
        init: DailySkinCareDashBoardController(),
        builder: (controller) {
        return Scaffold(
          body: controller.pages[controller.pageIndex.value],
          bottomNavigationBar: Container(
            height: 75.sp,
            decoration: const BoxDecoration(
              color: AppColors.colorFCF7FA,
            ),
            child: Column(
              children: [
                Divider(
                  height: 1.sp,
                  color: AppColors.colorF2E8EB,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.sp,horizontal: 16.sp),
                  child: SizedBox(
                    height: 54.sp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        commonBottomNavigationItem(
                          text: "Routine",
                          icon:  "assets/icons/ic_routine.png",
                          onTap: (){
                            controller.pageIndex.value = 0;
                          }
                        ),
                        commonBottomNavigationItem(
                          text: "Streaks",
                          icon: "assets/icons/ic_streaks.png",
                          onTap: (){
                            controller.pageIndex.value = 1;
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  commonBottomNavigationItem({VoidCallback? onTap, required String text, required String icon}){
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap ?? (){},
      child: SizedBox(
        height: 54.sp,
        width: 65.2.sp,
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 24.sp,
              height: 24.sp,
              color: AppColors.color964F66,
            ),
            CustomSize.verticalSpace(8.sp),
            CommonWidgets.customTextView(
              text: text,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.color964F66,
            )
          ],
        ),
      ),
    );
  }
}
