
import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:demo/task_screen/get_x_base_code/model/quiz_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class QuizController extends GetxController{

  RxList<QuestionData> questions = RxList([]);
  Rx<QuizModel> quizData = Rx(QuizModel());
  RxInt questionIndex = RxInt(0);
  RxInt totalScore = RxInt(0);
  RxString resultText = RxString("");
  late ConfettiController controllerCenter;

  void loadData() async{
    String data = await rootBundle.loadString("json/quiz.json");
    quizData.value = QuizModel.fromRawJson(data);
    questions.value = quizData.value.data?.question ?? [];
    // ignore: avoid_print
    print("Quiz Data: $quizData");
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
    controllerCenter = ConfettiController(duration: const Duration(seconds: 5));

  }

  resetQuiz() {
    questionIndex.value = 0;
    totalScore.value = 0;
    update();
  }

   answerQuestion(int score) {
    totalScore.value += score;

    questionIndex.value = questionIndex.value + 1;
    // ignore: avoid_print
    print(questionIndex.value);
    if (questionIndex.value < questions.length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      controllerCenter.play();
      print('No more questions!');
    }
  }


  //Remark Logic
   resultPhrase(int resultScore) {
    if (resultScore >= 41) {
      resultText.value = 'You are awesome!';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText.value = 'Pretty likeable!';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText.value = 'You need to work more!';
    } else if (resultScore >= 1) {
      resultText.value = 'You need to work hard!';
    } else {
      resultText.value = 'This is a poor score!';
      print(resultScore);
    }
    return resultText.value;
  }
}