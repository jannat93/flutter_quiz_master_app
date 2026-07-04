import 'package:flutter/material.dart';

import 'question.dart';

class QuizCategory {
  final String name;
  final IconData icon;
  final List<Question> questions;

  const QuizCategory({
    required this.name,
    required this.icon,
    required this.questions,
  });
}