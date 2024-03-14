import 'package:demo/core/z_file_core.dart';
import 'package:demo/task_screen/get_x_base_code/controller/daily_skincare_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutinePages extends StatelessWidget {
  const RoutinePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.colorFCF7FA,
        backgroundColor: AppColors.colorFCF7FA,
        title: Text(
          "Daily Skincare",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: AppColors.color1C0D12,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.colorFCF7FA,
      body: GetX<DailySkinCareDashBoardController>(
          init: DailySkinCareDashBoardController(),
          builder: (controller) {
            return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
                itemBuilder: (context, index) {
                  DailySkinCareModel model = controller.dailySkinCareList[index];
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 12.sp),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.colorF2E8EB,
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                padding: EdgeInsets.all(12.sp),
                                child: Image.asset(
                                  "assets/icons/ic_ticks.png",
                                  width: 24.sp,
                                  height: 24.sp,
                                  color: AppColors.color1C0D12,
                                ),
                              ),
                              CustomSize.horizontalSpace(16.sp),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.title ?? "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: AppColors.color1C0D12,
                                      ),
                                    ),
                                    Text(
                                      model.description ?? "",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: AppColors.color964F66,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/icons/ic_camera.png",
                          width: 27.sp,
                          height: 27.sp,
                        ),
                        Text(
                          model.time ?? "8:00 PM",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.color964F66,
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: controller.dailySkinCareList.length);
          }),
    );
  }
}
