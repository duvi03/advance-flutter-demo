import 'package:demo/core/common/common_function.dart';
import 'package:demo/core/constant/screen_util.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 27.sp),
            Center(
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.teal, border: Border.all(color: Colors.black, width: 3.sp)),
                height: 120.sp,
                width: 120.sp,
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(
                    Icons.person,
                    size: 100.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Center(child: CommonWidgets.customTextView(text: "Jhone Dezous", fontSize: 18.sp, fontWeight: FontWeight.w500)),
            SizedBox(height: 20.sp),
            Row(
              children: [
                const Icon(
                  Icons.email,
                ),
                SizedBox(width: 5.sp),
                CommonWidgets.customTextView(text: "abc@gmail.com", fontSize: 16.sp, fontWeight: FontWeight.w300),
              ],
            ),
            SizedBox(height: 8.sp),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                ),
                SizedBox(width: 5.sp),
                CommonWidgets.customTextView(text: "9876512345", fontSize: 16.sp, fontWeight: FontWeight.w300),
              ],
            ),
          ],
        ),
      ),
    );
  }
}