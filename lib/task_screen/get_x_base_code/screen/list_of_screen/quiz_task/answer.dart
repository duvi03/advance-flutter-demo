import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use SizedBox for white space instead of Container
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: InkWell(
          highlightColor: Colors.black.withOpacity(0.9),
          splashColor: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          onTap: selectHandler,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 6, // blur radius
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ],
              color: Colors.white.withOpacity(0.9),
            ),
            padding: const EdgeInsets.all(20),
            child: Text(
              answerText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
