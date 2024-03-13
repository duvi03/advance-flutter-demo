import 'dart:convert';

class QuizModel {
  int? status;
  QuizData? data;

  QuizModel({
    this.status,
    this.data,
  });

  QuizModel copyWith({
    int? status,
    QuizData? data,
  }) =>
      QuizModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory QuizModel.fromRawJson(String str) => QuizModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    status: json["status"],
    data: json["data"] == null ? null : QuizData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };

  @override
  String toString() {
    return 'QuizModel{status: $status, data: $data}';
  }
}

class QuizData {
  List<QuestionData>? question;

  QuizData({
    this.question,
  });

  QuizData copyWith({
    List<QuestionData>? question,
  }) =>
      QuizData(
        question: question ?? this.question,
      );

  factory QuizData.fromRawJson(String str) => QuizData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuizData.fromJson(Map<String, dynamic> json) => QuizData(
    question: json["question"] == null ? [] : List<QuestionData>.from(json["question"]!.map((x) => QuestionData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "question": question == null ? [] : List<dynamic>.from(question!.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'QuizData{question: $question}';
  }
}

class QuestionData {
  String? questionText;
  List<AnswerData>? answers;

  QuestionData({
    this.questionText,
    this.answers,
  });

  QuestionData copyWith({
    String? questionText,
    List<AnswerData>? answers,
  }) =>
      QuestionData(
        questionText: questionText ?? this.questionText,
        answers: answers ?? this.answers,
      );

  factory QuestionData.fromRawJson(String str) => QuestionData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionData.fromJson(Map<String, dynamic> json) => QuestionData(
    questionText: json["questionText"],
    answers: json["answers"] == null ? [] : List<AnswerData>.from(json["answers"]!.map((x) => AnswerData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "questionText": questionText,
    "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'QuestionData{questionText: $questionText, answers: $answers}';
  }
}

class AnswerData {
  String? text;
  int? score;

  AnswerData({
    this.text,
    this.score,
  });

  AnswerData copyWith({
    String? text,
    int? score,
  }) =>
      AnswerData(
        text: text ?? this.text,
        score: score ?? this.score,
      );

  factory AnswerData.fromRawJson(String str) => AnswerData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnswerData.fromJson(Map<String, dynamic> json) => AnswerData(
    text: json["text"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "score": score,
  };

  @override
  String toString() {
    return 'AnswerData{text: $text, score: $score}';
  }
}
