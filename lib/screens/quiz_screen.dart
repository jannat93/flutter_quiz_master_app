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
  State<QuizScreen> createState() =>
      _QuizScreenState();
}

class _QuizScreenState
    extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;

  String? selectedAnswer;

  void nextQuestion() {
    final currentQuestion =
    widget.category.questions[
    currentIndex];

    if (selectedAnswer ==
        currentQuestion.correctAnswer) {
      score++;
    }

    if (currentIndex <
        widget.category.questions.length -
            1) {
      setState(() {
        currentIndex++;
        selectedAnswer = null;
      });
    } else {
      context.go(
        '/result',
        extra: {
          'score': score,
          'total': widget.category.questions.length,
          'category': widget.category,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question =
    widget.category.questions[
    currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentIndex + 1} of ${widget.category.questions.length}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: (currentIndex + 1) /
                  widget.category
                      .questions
                      .length,
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding:
                const EdgeInsets.all(
                    16),
                child: Text(
                  question.questionText,
                  style:
                  const TextStyle(
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
                  question
                      .options[index];

                  return OptionTile(
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
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                selectedAnswer ==
                    null
                    ? null
                    : nextQuestion,
                child: Text(
                  currentIndex ==
                      widget
                          .category
                          .questions
                          .length -
                          1
                      ? 'Finish'
                      : 'Next',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}