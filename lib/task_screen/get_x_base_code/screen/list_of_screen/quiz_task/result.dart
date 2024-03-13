import 'package:demo/task_screen/get_x_base_code/controller/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetX(
        init: QuizController(),
          builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   controller.resultPhrase(controller.totalScore.value),
              //   style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              //   textAlign: TextAlign.center,
              // ),
              Text(
                'Score ' '${controller.totalScore.value}',
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: controller.resetQuiz(),
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(14),
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
