import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/quiz_category.dart';
import '../services/storage_service.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final QuizCategory category;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.category,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool saved = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!saved) {
      saved = true;

      StorageService.saveQuizResult(
        widget.score,
        widget.totalQuestions,
      );
    }
  }

  String getPerformanceMessage() {
    final percentage =
        (widget.score / widget.totalQuestions) * 100;

    if (percentage >= 80) {
      return "Excellent Work! 🎉";
    } else if (percentage >= 60) {
      return "Good Job! 👍";
    } else {
      return "Keep Practicing! 📚";
    }
  }

  @override
  Widget build(BuildContext context) {
    final wrongAnswers =
        widget.totalQuestions - widget.score;

    final percentage =
    ((widget.score / widget.totalQuestions) * 100)
        .toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const Icon(
              Icons.emoji_events,
              size: 100,
              color: Colors.amber,
            ),

            const SizedBox(height: 16),

            Text(
              getPerformanceMessage(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              '${widget.score}/${widget.totalQuestions}',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '$percentage%',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Theme.of(context)
                    .colorScheme
                    .primary,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(Icons.quiz),
                title: const Text('Total Questions'),
                trailing: Text(
                  widget.totalQuestions.toString(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                title: const Text('Correct Answers'),
                trailing: Text(
                  widget.score.toString(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                title: const Text('Wrong Answers'),
                trailing: Text(
                  wrongAnswers.toString(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.score),
                title: const Text('Final Score'),
                trailing: Text(
                  '${widget.score}/${widget.totalQuestions}',
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.percent),
                title: const Text('Percentage'),
                trailing: Text(
                  '$percentage%',
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.go('/');
                },
                icon: const Icon(Icons.home),
                label: const Text(
                  'Back To Home',
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.go(
                    '/quiz',
                    extra: widget.category,
                  );
                },
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Play Again',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}