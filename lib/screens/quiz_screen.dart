import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/quiz_category.dart';
import '../widgets/option_tile.dart';

class QuizScreen extends StatefulWidget {
  final QuizCategory category;

  const QuizScreen({
    super.key,
    required this.category,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;

  String? selectedAnswer;

  final List<Map<String, dynamic>> reviewAnswers = [];

  void nextQuestion() {
    final currentQuestion =
    widget.category.questions[currentIndex];

    reviewAnswers.add({
      'question': currentQuestion.questionText,
      'selectedAnswer': selectedAnswer,
      'correctAnswer':
      currentQuestion.correctAnswer,
      'isCorrect':
      selectedAnswer ==
          currentQuestion.correctAnswer,
    });

    if (selectedAnswer ==
        currentQuestion.correctAnswer) {
      score++;
    }

    if (currentIndex <
        widget.category.questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswer = null;
      });
    } else {
      context.go(
        '/result',
        extra: {
          'score': score,
          'total':
          widget.category.questions.length,
          'category': widget.category,
          'reviews': reviewAnswers,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question =
    widget.category.questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: true,
      ),
      body: Padding(
        padding:
        const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentIndex + 1} of ${widget.category.questions.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius:
              BorderRadius.circular(20),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: (currentIndex + 1) /
                    widget
                        .category
                        .questions
                        .length,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 3,
              shape:
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(16),
              ),
              child: Padding(
                padding:
                const EdgeInsets.all(18),
                child: Text(
                  question.questionText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount:
                question.options.length,
                itemBuilder:
                    (context, index) {
                  final option =
                  question.options[index];

                  return Padding(
                    padding:
                    const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: OptionTile(
                      option: option,
                      isSelected:
                      selectedAnswer ==
                          option,
                      onTap: () {
                        setState(() {
                          selectedAnswer =
                              option;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed:
                selectedAnswer == null
                    ? null
                    : nextQuestion,
                child: Text(
                  currentIndex ==
                      widget
                          .category
                          .questions
                          .length -
                          1
                      ? 'Finish Quiz'
                      : 'Next Question',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}