import 'package:flutter/material.dart';

class HistoryDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> history;

  const HistoryDetailsScreen({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    final List<dynamic> answers =
        history['answers'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer Sheet'),
        centerTitle: true,
      ),
      body: answers.isEmpty
          ? const Center(
        child: Text(
          'No answers found',
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          final item = answers[index];

          final bool isCorrect =
              item['isCorrect'] ?? false;

          return Card(
            elevation: 3,
            margin:
            const EdgeInsets.only(
              bottom: 12,
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${index + 1}',
                    style:
                    const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    item['question'] ??
                        '',
                    style:
                    const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Your Answer',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  Text(
                    item['selectedAnswer']
                        ?.toString() ??
                        'Not Answered',
                    style: TextStyle(
                      color: isCorrect
                          ? Colors.green
                          : Colors.red,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Correct Answer',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  Text(
                    item['correctAnswer']
                        ?.toString() ??
                        '',
                    style:
                    const TextStyle(
                      color:
                      Colors.green,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Icon(
                        isCorrect
                            ? Icons
                            .check_circle
                            : Icons.cancel,
                        color: isCorrect
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(
                          width: 8),
                      Text(
                        isCorrect
                            ? 'Correct'
                            : 'Wrong',
                        style:
                        TextStyle(
                          color: isCorrect
                              ? Colors.green
                              : Colors.red,
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}