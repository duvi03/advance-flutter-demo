import 'package:get/get.dart';

class StaticController extends GetxController{

  RxBool notificationSwitch = false.obs;
  RxBool darkMoodSwitch = false.obs;
  RxBool privateAccountSwitch = true.obs;

  void notificationToggle() => notificationSwitch.value = notificationSwitch.value ? false : true;
  void darkMoodToggle() => darkMoodSwitch.value = darkMoodSwitch.value ? false : true;
  void privateAccountToggle() => privateAccountSwitch.value = privateAccountSwitch.value ? false : true;

}