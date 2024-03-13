import 'package:demo/task_screen/get_x_base_code/screen/pages/home.dart';
import 'package:demo/task_screen/get_x_base_code/screen/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController{
  RxInt pageIndex = RxInt(0);

  RxList<Widget> pages = RxList([
    const HomeScreen(),
    const ProfileScreen(),
  ]);

}