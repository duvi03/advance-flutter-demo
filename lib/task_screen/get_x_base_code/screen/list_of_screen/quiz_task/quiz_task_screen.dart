import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:demo/core/common/common_function.dart';
import 'package:demo/task_screen/get_x_base_code/controller/quiz_controller.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/quiz_task/quiz.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/quiz_task/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizTaskScreen extends StatelessWidget {
  const QuizTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Tak'),
      ),
      body: GetX<QuizController>(
        init: QuizController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: controller.questions.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : controller.questionIndex.value < controller.questions.length
                    ? Quiz(
                        questionIndex: controller.questionIndex.value,
                        questions: controller.questions,
                      )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    controller.resultPhrase(controller.totalScore.value),
                                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Score ' '${controller.totalScore.value}',
                                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: ConfettiWidget(
                                confettiController: controller.controllerCenter,
                                blastDirectionality: BlastDirectionality.explosive,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.resetQuiz();
                          },
                          child: CommonWidgets.customTextView(text: 'Restart Quiz'),
                        ),
                        // GestureDetector(
                        //   onTap: controller.resetQuiz,
                        //   child: Container(
                        //     color: Colors.green,
                        //     padding: const EdgeInsets.all(14),
                        //     child: const Text(
                        //       'Restart Quiz',
                        //       style: TextStyle(color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
          );
        },
      ),
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 20),
    );
  }
}
