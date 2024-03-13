import 'package:flutter/material.dart';

class CommonCard{
  static commonCard({
    required String title,
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.shade50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 70, color: Colors.blue),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}