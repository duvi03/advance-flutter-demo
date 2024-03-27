import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';

class CommonGridviewItem extends StatelessWidget {
  String image;
  String title;
  VoidCallback? onTap;
  CommonGridviewItem({super.key,required this.image, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 20,
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.sp),

              ),
              padding: EdgeInsets.all(12.sp),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                child: Image.asset(
                  image,
                  height: 80.sp,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.sp),
          CommonWidgets.customTextView(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 14.sp),
        ],
      ),
    );
  }
}
