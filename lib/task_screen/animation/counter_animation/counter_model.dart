import 'package:demo/core/constant/screen_util.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CounterModel extends ChangeNotifier {
  late AnimationController animationController;

  CounterModel({required TickerProvider vsync}) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    );
  }

  String get timerString {
    Duration duration = animationController.duration! * animationController.value;
    int count = 1;
    count = duration.inSeconds % 60 + 1;
    return count.toString();
  }

  popDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });

          return  AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  elevation: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            "COUNT DOWN",
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                            )
                        ),
                        SizedBox(height: 10.sp,),
                        Transform.rotate(
                          angle: animationController.value * 4 * math.pi,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                width: 224.sp,
                                height: 180.sp,
                              child: Image.asset('assets/images/exam_rotation.png'),
                            ),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.center,
                          child: Text(
                            timerString,
                            style: TextStyle(fontSize: 45.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          );
        });
  }
}
