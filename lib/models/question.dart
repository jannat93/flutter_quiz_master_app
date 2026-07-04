import 'package:flutter/foundation.dart';

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  const Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}