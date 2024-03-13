import 'package:demo/task_screen/get_x_base_code/controller/quiz_controller.dart';
import 'package:demo/task_screen/get_x_base_code/model/quiz_model.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/quiz_task/answer.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/quiz_task/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Quiz extends StatelessWidget {
  final List<QuestionData> questions;
  final int questionIndex;

  const Quiz({
    Key? key,
    required this.questions,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<QuizController>(
      builder: (controller) {
        return Column(
          children: [
            Question(
              questions[questionIndex].questionText.toString(),
            ),
            ...(questions[questionIndex].answers ?? []).map((answer) {
              return Answer(() => controller.answerQuestion(answer.score ?? 0), answer.text.toString());
            }).toList()
          ],
        );
      }
    );
  }
}
