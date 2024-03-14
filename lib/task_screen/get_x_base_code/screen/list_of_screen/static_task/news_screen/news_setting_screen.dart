import 'package:demo/core/common/common_function.dart';
import 'package:demo/core/constant/z_file_constant.dart';
import 'package:demo/task_screen/get_x_base_code/controller/news_static_controller.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/news_screen/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NewSettingScreen extends StatelessWidget {
  const NewSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100.withOpacity(0.5),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomSize.verticalSpace(statusBarHeight + 10.sp),

                  ///App bar title
                  CommonWidgets.customTextView(
                    text: "Settings",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSize.verticalSpace(5.sp),

                  ///body
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 20.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///User profile image
                        Container(
                          height: 80.sp,
                          width: 80.sp,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellowAccent,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "images/user_1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        CustomSize.horizontalSpace(20.sp),

                        ///User name email and sign out text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonWidgets.customTextView(
                                text: "Michael Faradey",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                              CommonWidgets.customTextView(
                                text: "michaelfaradey@gmail.com",
                                fontSize: 12.sp,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomSize.verticalSpace(10.sp),
                              CommonWidgets.customTextView(
                                text: "Sign Out",
                                fontSize: 13.sp,
                                color: Colors.orange[700],
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.sp),
                  child: GetBuilder(
                      init: StaticController(),
                      builder: (controller) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSize.verticalSpace(30.sp),

                              ///Dark mode and notification switch button
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(4.sp))),
                                padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 14.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonSettingList(
                                      text: "Dark Mood",
                                      isSwitchShow: true,
                                      switchChild: Obx(
                                            () => CustomSwitch(
                                          value: controller.darkMoodSwitch.value,
                                          onChanged: (val) => controller.darkMoodToggle(),
                                        ),
                                      ),
                                    ),
                                    CustomSize.verticalSpace(14.sp),
                                    commonSettingList(
                                      text: "Notifications",
                                      isSwitchShow: true,
                                      switchChild: Obx(
                                            () => CustomSwitch(
                                          value: controller.notificationSwitch.value,
                                          onChanged: (val) => controller.notificationToggle(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomSize.verticalSpace(30.sp),

                              ///Account title
                              CommonWidgets.customTextView(
                                text: "Account",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomSize.verticalSpace(10.sp),

                              ///Account Content (edit account, change password, language)
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(4.sp))),
                                padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 16.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonSettingList(
                                      text: "Edit Account",
                                    ),
                                    CustomSize.verticalSpace(16.sp),
                                    commonSettingList(
                                      text: "Change Password",
                                    ),
                                    CustomSize.verticalSpace(16.sp),
                                    commonSettingList(
                                      text: "Language",
                                    ),
                                    CustomSize.verticalSpace(16.sp),
                                    commonSettingList(
                                        text: "News Detail Page",
                                        onTap: () {
                                          Get.to(() => const NewsDetailScreen());
                                        }),
                                  ],
                                ),
                              ),
                              CustomSize.verticalSpace(30.sp),

                              ///Privacy and Security title
                              CommonWidgets.customTextView(
                                text: "Privacy and Security",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomSize.verticalSpace(10.sp),

                              ///Privacy and Security content
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(4.sp))),
                                padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 16.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonSettingList(
                                      text: "Private Account",
                                      isSwitchShow: true,
                                      switchChild: Obx(
                                            () => CustomSwitch(
                                          value: controller.privateAccountSwitch.value,
                                          onChanged: (val) => controller.privateAccountToggle(),
                                        ),
                                      ),
                                    ),
                                    CustomSize.verticalSpace(16.sp),
                                    commonSettingList(
                                      text: "Privacy and Security Help",
                                    ),
                                  ],
                                ),
                              ),
                              CustomSize.verticalSpace(10.sp),

                              ///static UI for latest news listiing
                              Container(
                                height: 140.sp,
                                padding: EdgeInsets.only(left: 18.sp),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10.sp, left: 15.sp),
                                        child: Container(
                                          width: double.infinity,
                                          height: 140.sp,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12.sp))),
                                          padding: EdgeInsets.only(left: 18.sp),
                                          child: Row(
                                            children: [
                                              CustomSize.horizontalSpace(100.sp),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(right: 18.sp),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      CustomSize.verticalSpace(10.sp),
                                                      CommonWidgets.customTextView(
                                                        text: "Animals get boost from Southampton tree vandals",
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w600,
                                                        maxLine: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      CustomSize.verticalSpace(35.sp),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          CommonWidgets.customTextView(
                                                            text: "15 minutes ago",
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w700,
                                                            color: Colors.grey.shade600,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(right: 18.sp),
                                                            child: Icon(
                                                              Icons.bookmark,
                                                              size: 16.sp,
                                                              color: Colors.orange,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.sp),
                                        child: Image.asset(
                                          "images/user_1.png",
                                          fit: BoxFit.cover,
                                          height: 120.sp,
                                          width: 120.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              CustomSize.verticalSpace(30.sp),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  //create common widget of row for both switch and arrow icon
  commonSettingList({required String text, Widget? switchChild, bool isSwitchShow = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonWidgets.customTextView(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
          isSwitchShow
              ? switchChild ?? Container()
              : Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
          ),
        ],
      ),
    );
  }
}
