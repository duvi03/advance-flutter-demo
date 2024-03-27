import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';

class AnimeGridviewItem extends StatelessWidget {
  String title;
  VoidCallback? onTap;

  AnimeGridviewItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Card(
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12.sp),
          ),
          padding: EdgeInsets.all(12.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonWidgets.customTextView(
                text: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
