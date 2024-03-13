import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ConnectivityChecker {
  Future<bool> checkConnectivity() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      Console.debug("Device connected with internet");
      return true;
    } else {
      Console.debug("Device not connected with internet");
      return false;
    }
  }
}

class ConnectivityCheckerService extends GetxService {
  late StreamSubscription subscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      // Got a new connectivity status!
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        Console.debug("Device connected with internet", key: "Internet Connection Status");
        showSnackBar(isOnline: true);
      } else {
        Console.debug("Device not connected with internet", key: "Internet Connection Status");
        showSnackBar(isOnline: false);
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    subscription.cancel();
  }

  void showSnackBar({required bool isOnline}) {
    Console.debug("Snack Bar CallingFile....");
    final snackBar = SnackBar(
      content: Container(
          height: 25,
          width: double.infinity,
          alignment: Alignment.center,
          child: CommonWidgets.customTextView(
            text:   isOnline ? "Back Online" : "No Connection",
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: isOnline ? AppColors.success : AppColors.appTheme,
          ),
      ),
      backgroundColor: isOnline ? const Color(0xffEBF8ED) : const Color(0xffFFF5F7),
      elevation: 0.6,
      padding: EdgeInsets.zero,
      duration: isOnline ? const Duration(seconds: 3) : const Duration(days: 1),
    );

    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}