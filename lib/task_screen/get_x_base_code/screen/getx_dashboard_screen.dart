import 'package:demo/core/z_file_core.dart';
import 'package:demo/task_screen/get_x_base_code/controller/dashboard_controller.dart';
import 'package:demo/task_screen/get_x_base_code/screen/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXDashBoardScreen extends StatelessWidget {
  const GetXDashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<DashBoardController>(
      init: DashBoardController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: CommonWidgets.customTextView(text: "Get X"),
            automaticallyImplyLeading: true,
          ),
          body: controller.pages[controller.pageIndex.value],
          bottomNavigationBar: Container(
            height: 80.sp,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightGrey,
                  blurRadius: 10,
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 12.sp, bottom: 20.sp),
            child: SizedBox(
              height: 45.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomNavItem(
                      icon: Icons.home,
                      title: "Home",
                      selectedColor: controller.pageIndex.value == 0 ? AppColors.appTheme : AppColors.grey,
                      onTap: () {
                        controller.pageIndex.value = 0;
                      }),
                  BottomNavItem(
                      icon: Icons.account_circle,
                      title: "Profile",
                      selectedColor: controller.pageIndex.value == 1 ? AppColors.appTheme : AppColors.grey,
                      onTap: () {
                        controller.pageIndex.value = 1;
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
