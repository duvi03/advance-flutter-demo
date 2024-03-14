import 'package:demo/core/z_file_core.dart';
import 'package:demo/task_screen/get_x_base_code/controller/daily_skincare_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StreaksPages extends StatelessWidget {
  const StreaksPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorFCF7FA,
      appBar: AppBar(
        backgroundColor: AppColors.colorFCF7FA,
        surfaceTintColor: AppColors.colorFCF7FA,
        title: Text(
          "Streaks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: AppColors.color1C0D12,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: GetX<DailySkinCareDashBoardController>(
          init: DailySkinCareDashBoardController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSize.verticalSpace(20.sp),

                    ///today goal title
                    Text(
                      "Today's Goal: 3 streak days",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                        color: AppColors.color1C0D12,
                      ),
                    ),

                    ///streak day container
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 16.sp),
                      decoration: BoxDecoration(
                        color: AppColors.colorF2E8EB,
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      padding: EdgeInsets.all(24.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Streak Days",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: AppColors.color1C0D12,
                            ),
                          ),
                          CustomSize.verticalSpace(8.sp),
                          Text(
                            "2",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              color: AppColors.color1C0D12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///daily streak graph container
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 24.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Daily Streak",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: AppColors.color1C0D12,
                            ),
                          ),
                          CustomSize.verticalSpace(8.sp),
                          Text(
                            "2",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32.sp,
                              color: AppColors.color1C0D12,
                            ),
                          ),
                          CustomSize.verticalSpace(8.sp),
                          Row(
                            children: [
                              Text(
                                "Last 30 Days",
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.sp, color: AppColors.color964F66),
                              ),
                              Text(
                                " + 100%",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: AppColors.color088759,
                                ),
                              ),
                            ],
                          ),
                          CustomSize.verticalSpace(8.sp),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 16.sp),
                            height: 207.2.sp,
                            child: SfCartesianChart(
                              plotAreaBorderWidth: 0,
                              primaryXAxis: DateTimeAxis(
                                majorGridLines: const MajorGridLines(width: 0),
                                axisLine: const AxisLine(width: 0),
                                majorTickLines: const MajorTickLines(width: 0),
                                maximumLabels: 5,
                                dateFormat: DateFormat("yy"),
                                labelStyle: TextStyle(
                                  color: AppColors.color964F66,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              primaryYAxis: const NumericAxis(
                                isVisible: false,
                              ),
                              series: [
                                SplineAreaSeries<ChartData, DateTime>(
                                    borderColor: AppColors.color964F66,
                                    borderWidth: 2,
                                    splineType: SplineType.cardinal,
                                    cardinalSplineTension: 0.9,
                                    gradient: LinearGradient(
                                        colors: [
                                          AppColors.color964F66.withOpacity(0.2),
                                          AppColors.color964F66.withOpacity(0),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                    dataSource: controller.chartData.value,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///keep it up text
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 4.sp, bottom: 12.sp),
                      child: Text(
                        "Keep it up! You're on a roll",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.sp,
                          color: AppColors.color1C0D12,
                        ),
                      ),
                    ),

                    ///get start container
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 12.sp),
                      decoration: BoxDecoration(
                        color: AppColors.colorF2E8EB,
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 9.5.sp),
                      child: Center(
                        child: Text(
                          "Get started",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: AppColors.color1C0D12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
