import 'package:demo/core/constant/shape_dashboard.dart';
import 'package:demo/core/z_file_core.dart';
import 'package:demo/my_dashboard_screen/widget/common_card.dart';
import 'package:demo/my_dashboard_screen/widget/common_navigator.dart';
import 'package:demo/task_screen/coin_game/coin_game_screen.dart';
import 'package:demo/task_screen/counter_animation/counter_widget.dart';
import 'package:demo/task_screen/expense_tracker_app/expense_screen.dart';
import 'package:demo/task_screen/game_zome/game_home_screen.dart';
import 'package:demo/task_screen/get_x_base_code/screen/getx_dashboard_screen.dart';
import 'package:demo/task_screen/static_task/developer_profile.dart';
import 'package:demo/task_screen/stories_view_app/home_page.dart';
import 'package:demo/task_screen/worked_hour/work_hours_form.dart';

import 'package:flutter/material.dart';

class MyDashboard1 extends StatelessWidget {
  const MyDashboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            pinned: true,
            floating: true,
            primary: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: 10.sp),
              expandedTitleScale: 1.7,
              title: InvisibleExpandedHeader(
                child: CommonWidgets.customTextView(
                  text: "My Dashboard",
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: InteractiveViewer(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: ShapeDashboard(),
                      child: Container(
                        height: 250.sp,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[Colors.blue, Colors.blue.shade300],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CommonWidgets.customTextView(
                        text: "My Dashboard",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            expandedHeight: 230,
            backgroundColor: Colors.blue,
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              color: Colors.white,
              child: Column(
                children: [
                  CustomSize.verticalSpace(20.sp),
                  Row(
                    children: [
                      Container(
                        height: 55.sp,
                        padding: EdgeInsets.only(right: 10.sp),
                        child: VerticalDivider(
                          color: Colors.orange,
                          width: 10.sp,
                          thickness: 3.sp,
                        ),
                      ),
                      Expanded(
                        child: CommonWidgets.customTextView(
                          text: "A ruggedly beautiful quarantine site",
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                          maxLine: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  CustomSize.verticalSpace(20.sp),
                  CommonWidgets.customTextView(
                    text: AppString.newsDetail1,
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSize.verticalSpace(30.sp),
                  CommonWidgets.customTextView(
                    text: AppString.newsDetail2,
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSize.verticalSpace(30.sp),
                  CommonWidgets.customTextView(
                    text: AppString.newsDetail1,
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSize.verticalSpace(10.sp),
                  CommonWidgets.customTextView(
                    text: AppString.newsDetail2,
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var status = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: ShapeDashboard(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: <Color>[Colors.blue, Colors.blue.shade300],
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              children: [
                SizedBox(height: status + 47.sp),
                CommonWidgets.customTextView(
                  text: "My Dashboard",
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 15.sp),
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
                          CommonCard.commonCard(
                              title: "Profile",
                              iconData: Icons.person,
                              onTap: () {
                                CommonNavigator.navigateTo(
                                  context,
                                  className: const DeveloperProfile(),
                                );
                              }),
                          CommonCard.commonCard(
                              title: "Get X",
                              iconData: Icons.g_mobiledata,
                              onTap: () {
                                CommonNavigator.navigateTo(
                                  context,
                                  className: const GetXDashBoardScreen(),
                                );
                              }),
                          CommonCard.commonCard(
                              title: "Games Zone",
                              iconData: Icons.videogame_asset,
                              onTap: () {
                                CommonNavigator.navigateTo(
                                  context,
                                  className: const GameHomeScreen(),
                                );
                              }),
                          CommonCard.commonCard(
                              title: "Coin Game",
                              iconData: Icons.gamepad_outlined,
                              onTap: () {
                                CommonNavigator.navigateTo(
                                  context,
                                  className: const CoinGameScreen(),
                                );
                              }),
                          CommonCard.commonCard(
                              title: "Expenses Tracker",
                              iconData: Icons.ballot_outlined,
                              onTap: () {
                                CommonNavigator.navigateTo(
                                  context,
                                  className: const ExpenseScreenProvider(),
                                );
                              }),
                          CommonCard.commonCard(
                              title: "Work Hours Tracker",
                              iconData: Icons.timeline_rounded,
                              onTap: () {
                                CommonNavigator.navigateTo(
                                  context,
                                  className: const WorkHoursTracker(),
                                );
                              }),
                          CommonCard.commonCard(
                              title: "Counter Animation",
                              iconData: Icons.timer,
                              onTap: () {
                                CommonNavigator.navigateTo(
                                  context,
                                  className: const WrongAnswer(),
                                );
                              }),
                          CommonCard.commonCard(
                              title: "Stories Tutorial",
                              iconData: Icons.amp_stories_outlined,
                              onTap: () {
                                CommonNavigator.navigateTo(
                                  context,
                                  className: const StoriesTutorialPage(),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
