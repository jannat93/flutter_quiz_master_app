import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/storage_service.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  State<ResultScreen> createState() =>
      _ResultScreenState();
}

class _ResultScreenState
    extends State<ResultScreen> {
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

  @override
  Widget build(BuildContext context) {
    final wrongAnswers =
        widget.totalQuestions -
            widget.score;

    final percentage =
    ((widget.score /
        widget.totalQuestions) *
        100)
        .toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz Result',
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.emoji_events,
                size: 80,
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                '${widget.score}/${widget.totalQuestions}',
                style:
                const TextStyle(
                  fontSize: 36,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                title: const Text(
                    'Total Questions'),
                trailing: Text(
                  widget.totalQuestions
                      .toString(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text(
                    'Correct Answers'),
                trailing: Text(
                  widget.score
                      .toString(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text(
                    'Wrong Answers'),
                trailing: Text(
                  wrongAnswers
                      .toString(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text(
                    'Percentage'),
                trailing:
                Text('$percentage%'),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text(
                  'Back To Home',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}