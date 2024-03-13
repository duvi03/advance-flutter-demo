import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo/core/z_file_core.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class CommonWidgets {
  static showProgressDialog({String? msg}) {
    showDialog(
        context: navigatorKey.currentContext ?? Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.sp,
                width: 60.sp,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  child: CircularProgressIndicator(color: AppColors.appTheme),
                ),
              ),
              if (msg?.isNotEmpty ?? false)
                const SizedBox(
                  height: 10.0,
                ),
              if (msg?.isNotEmpty ?? false)
                CommonWidgets.customTextView(
                  text: msg ?? "",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Colors.white,
                )
            ],
          );
        });
  }

  static Future customDialog(String title, BuildContext context, String desc) {
    return showDialog(
      barrierColor: Colors.black26,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: title,
          description: desc,
        );
      },
    );
  }

  void customSnackBar({required String msg, required String title, SnackPosition? snackPosition, Duration? duration}) {
    Get.snackbar(title ?? '', msg,
        snackPosition: snackPosition ?? SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: duration ?? const Duration(seconds: 3));
  }

  static void dismissProgressDialog() {
    Get.back();
  }

  static Widget noDataAvailable({String? msg}){
    return SizedBox(
      height: 400.sp,
      child: Center(
        child: CommonWidgets.customTextView(
          text: msg ?? "No Data Available",
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget customTextView(
      {required String text,
      Color? color,
      Color? backgroundColor,
      double? fontSize,
      FontWeight? fontWeight,
      TextDecoration? textDecoration,
      TextAlign? textAlign,
      TextOverflow? overflow,
      Paint? foreGround,
      double? lineHeight,
      TextStyle? style,
      int? maxLine}) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: style ??
          TextStyle(
            decoration: textDecoration ?? TextDecoration.none,
            fontSize: fontSize,
            height: lineHeight,
            fontWeight: fontWeight,
            foreground: foreGround,
            backgroundColor: backgroundColor,
            color: color,
          ),
    );
  }

  static Widget buildTextField({
    hintText,
    List<String>? autoFillHints,
    String? description,
    bool? required = false,
    InputDecoration? decoration,
    width,
    void Function(String?)? onSaved,
    void Function()? onTap,
    String? initialValue,
    String? helperText,
    bool enabled = true,
    bool unlinkState = false,
    bool readonly = false,
    bool obscureText = false,
    bool isActive = true,
    Key? key,
    int maxLines = 1,
    Widget? prefixIcon,
    String? prefixText,
    Widget? suffixIcon,
    TextStyle? textStyle,
    int? maxLength,
    TextEditingController? controller,
    TextInputType textInputType = TextInputType.text,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    OutlineInputBorder? outlineInputBorder,
    List<TextInputFormatter>? inputFormatters,
    AutovalidateMode? autoValidateMode,
    Function(String? value)? onChanged,
    Function(String? value)? onFieldSubmitted,
    EdgeInsets? scrollPadding,
    EdgeInsets? contentPadding,
    Function()? onEditingComplete,
    String? counterText,
    double? borderRadius,
    Color? fillColor,
  }) {
    return TextFormField(
      autofillHints: autoFillHints,
      onTap: onTap,
      validator: !unlinkState ? validator : null,
      maxLength: maxLength,
      textInputAction: textInputAction,
      controller: unlinkState
          ? TextEditingController()
          : initialValue == null
              ? controller
              : TextEditingController.fromValue(
                  TextEditingValue(
                    text: initialValue,
                    selection: TextSelection.fromPosition(
                      TextPosition(
                        offset: initialValue.length,
                      ),
                    ),
                  ),
                ),
      enabled: enabled,
      onChanged: !unlinkState ? onChanged : null,
      autovalidateMode: autoValidateMode,
      keyboardType: textInputType,
      key: key,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      maxLines: maxLines,
      readOnly: readonly,
      focusNode: focusNode,
      style: textStyle ??
          TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        counterText: counterText,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 20.sp, horizontal: 24.sp),
        filled: true,
        fillColor: fillColor ?? AppColors.blue,
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.error,
        ),
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGrey,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none,
        ),
        alignLabelWithHint: true,
        focusColor: AppColors.black,
        hintText: hintText,
        prefixText: prefixText,
        prefixStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        helperText: helperText ?? "",
        enabledBorder: outlineInputBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue, width: 0), borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 56.sp))),
        errorBorder: outlineInputBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 56.sp)), borderSide: BorderSide(color: AppColors.error, width: 1)),
        focusedBorder: outlineInputBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 1), borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 56.sp))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey, width: 1), borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 56.sp))),
      ),
      onSaved: !unlinkState ? onSaved : null,
    );
  }
}
