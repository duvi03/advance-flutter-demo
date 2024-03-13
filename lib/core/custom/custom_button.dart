import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  final String? icon;
  final Color? buttonColor;
  final Color textColor;
  final Color? borderColor;

  const CustomButton({
    required this.name,
    required this.onTap,
    this.icon,
    this.buttonColor,
    this.textColor = Colors.white,
    this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: AppColors.white.withOpacity(0.3),
        onTap: onTap ?? () {},
        child: Ink(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(56.sp),
            border: borderColor != null ? Border.all(color: borderColor ?? AppColors.lightGrey, width: 2.sp) : null,
            color: borderColor != null ? null : buttonColor ?? AppColors.appTheme,
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null && icon != "") ...[
                Image.asset(
                  icon ?? "",
                  color: borderColor != null  ? null : textColor,
                  height: 24.sp,
                  width: 24.sp,
                ),
                CustomSize.horizontalSpace(12.sp),
              ],
              CommonWidgets.customTextView(
                text: name,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: textColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
