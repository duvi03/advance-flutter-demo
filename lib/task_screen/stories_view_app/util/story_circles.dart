import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final function;
  final String image;

  const StoryCircle({super.key, this.function, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: ClipOval(
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
