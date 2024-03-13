import 'package:flutter/material.dart';

class MyStory3 extends StatelessWidget {
  const MyStory3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Image.network(
              "https://random.imagecdn.app/800/1090",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),),
      ),
    );
  }
}
