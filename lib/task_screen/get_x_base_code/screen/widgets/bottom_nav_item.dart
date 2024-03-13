import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';


class BottomNavItem extends StatelessWidget {
  String? iconString;
  IconData? icon;
  String title;
  VoidCallback onTap;
  Color selectedColor;
   BottomNavItem({Key? key,this.iconString,this.icon, required this.title, required this.onTap, required this.selectedColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: 50.sp,
        width: 79.sp,
        child: Column(
          children: [
            if(icon != null)
              Icon(icon,size: 24.sp,)
            else
              Image.asset(
              iconString ?? "",
              height: 24.sp,
              width: 24.sp,
              color: selectedColor,
            ),
            CustomSize.verticalSpace(4.sp),
            CommonWidgets.customTextView(text: title, fontSize: 12.sp, fontWeight: FontWeight.w400, color: selectedColor)
          ],
        ),
      ),
    );
  }
}
