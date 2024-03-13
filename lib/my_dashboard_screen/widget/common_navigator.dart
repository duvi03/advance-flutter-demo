import 'package:flutter/material.dart';

class CommonNavigator{

  static navigateTo(BuildContext context,{required Widget className}){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)  => className,
      ),
    );
  }
}