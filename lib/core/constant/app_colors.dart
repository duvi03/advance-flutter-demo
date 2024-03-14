import 'package:flutter/material.dart';

class AppColors{
  static Color appTheme = const Color(0xff524EB7);
  static Color white = const Color(0xffffffff);
  static Color black = const Color(0xff17171A);
  static Color error = const Color(0xffB74E4E);
  static Color blue = const Color(0xffF5F5FA);
  static Color grey = const Color(0xffACABB2);
  static Color success = const Color(0xff3F9E4C);

  static Color lightBlue = const Color(0xffBEDDFC);
  static Color lightGrey = const Color(0xffE1E1E5);
  static Color blur = const Color(0xFF7171A52);
  static Color blur1 = const Color(0xFF17171A66);
  static Color line = const Color(0xffe1e0e5);
  static Color rejected = const Color(0xff800000);

  static Color darkGrey = const Color(0xff767580);
  static Color random1 = const Color(0xffFFF2E5);
  static Color random2 = const Color(0xffE6F3FF);
  static Color random3 = const Color(0xffDCF5F5);
  static Color random4 = const Color(0xffFFE7E5);
  static Color random5 = const Color(0xffE8F5DC);
  static Color random6 = const Color(0xfff3eef7);
  static Color random7 = const Color(0xffE5EEFF);
  static Color random8 = const Color(0xffFFE5EF);
  static Color random9 = const Color(0xffFFEEE5);
  static Color random10 = const Color(0xffFFF6E5);
  static Color random11 = const Color(0xffFFF9E5);

  static const Color color964F66= Color(0xff964F66);
  static const Color color088759= Color(0xff088759);
  static const Color color1C0D12= Color(0xff1C0D12);
  static const Color colorFCF7FA= Color(0xffFCF7FA);
  static const Color colorF2E8EB= Color(0xffF2E8EB);
  static const Color colorFFFFFF= Color(0xffFFFFFF);

  LinearGradient rejectedGradiant =  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
    stops: const [0.2, 0.9],
    colors: [
      rejected.withOpacity(0.0),
      rejected.withOpacity(0.8),
    ],
  );
  LinearGradient underReviewGradiant =  LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topRight,
    stops: const [0.2, 0.9],
    colors: [
      black.withOpacity(.8),
      black.withOpacity(.0),
    ],
  );

  getColor(int index) {
    if (index % 11 == 0) {
      return AppColors.random11;
    } else if (index % 10 == 0) {
      return AppColors.random10;
    } else if (index % 9 == 0) {
      return AppColors.random9;
    } else if (index % 8 == 0) {
      return AppColors.random8;
    } else if (index % 7 == 0) {
      return AppColors.random7;
    } else if (index % 6 == 0) {
      return AppColors.random6;
    } else if (index % 5 == 0) {
      return AppColors.random5;
    } else if (index % 4 == 0) {
      return AppColors.random4;
    } else if (index % 3 == 0) {
      return AppColors.random3;
    } else if (index % 2 == 0) {
      return AppColors.random2;
    } else if (index % 1 == 0) {
      return AppColors.random1;
    } else {
      return AppColors.appTheme;
    }
  }
}

class CustomSize{
  static verticalSpace(double height){
    return SizedBox(height: height);
  }
  static horizontalSpace(double width){
    return SizedBox(width: width);
  }
}
class AppString{
  static String newsDetail1 = "Former president Donald Trump "
      "asked Elon Musk last summer whether the billionaire industrialist would "
      "be interested in buying Trump’s social network Truth Social, according to two"
      "people with knowledge of the conversation. Cut through the 2024 election noise.";
  static String newsDetail2 = "Despite combining for 32 nominations, Netflix and Apple "
      "TV+ were nearly shut out of of the 2024 Oscars, with Netflix winning a "
      "single award for Wes Anderson's The Wonderful Story of Henry Sugar "
      "(Best Live Action Short Film). The big surprise was Martin Scorse.";
}