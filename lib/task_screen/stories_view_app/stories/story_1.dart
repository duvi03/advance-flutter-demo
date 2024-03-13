import 'package:flutter/material.dart';

class MyStory1 extends StatelessWidget {
  const MyStory1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Image.network(
              "https://random.imagecdn.app/500/1050",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),),
      ),
    );
  }
}
