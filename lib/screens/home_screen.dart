import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/quiz_data.dart';
import '../providers/theme_provider.dart';
import '../services/storage_service.dart';
import '../widgets/category_card.dart';
import '../widgets/stat_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int attempts = 0;
  int highestScore = 0;
  int lastScore = 0;
  List<String> history = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadStats();
  }

  Future<void> loadStats() async {
    final loadedAttempts =
    await StorageService.getTotalAttempts();

    final loadedHighest =
    await StorageService.getHighestScore();

    final loadedLast =
    await StorageService.getLastScore();

    final loadedHistory =
    await StorageService.getHistory();

    if (!mounted) return;

    setState(() {
      attempts = loadedAttempts;
      highestScore = loadedHighest;
      lastScore = loadedLast;
      history = loadedHistory;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider =
    Provider.of<ThemeProvider>(context);

    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context)
                .colorScheme
                .surfaceContainerHighest,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF10B981),
                        Color(0xFF06B6D4),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.quiz_rounded,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        'Quiz Master',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Ready for a challenge?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(14),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                  ),
                  child: IconButton(
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                    icon: Icon(
                      themeProvider.isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: loadStats,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Welcome Banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context)
                        .colorScheme
                        .primary,
                    Theme.of(context)
                        .colorScheme
                        .secondary,
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Quiz Master!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Test your knowledge and improve your learning skills.',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Statistics
            const Text(
              'Statistics',
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.8,
              children: [
                StatCard(
                  title: 'Attempts',
                  value: attempts.toString(),
                  icon: Icons.repeat,
                ),
                StatCard(
                  title: 'Highest',
                  value: highestScore.toString(),
                  icon: Icons.star,
                ),
                StatCard(
                  title: 'Last',
                  value: lastScore.toString(),
                  icon: Icons.history,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Categories
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              itemCount:
              quizCategories.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemBuilder:
                  (context, index) {
                final category =
                quizCategories[index];

                return CategoryCard(
                  title: category.name,
                  icon: category.icon,
                  questionCount:
                  category.questions.length,
                  onTap: () {
                    context.push(
                      '/quiz',
                      extra: category,
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            // History
            const Text(
              'Recent History',
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            if (history.isEmpty)
              Card(
                child: Padding(
                  padding:
                  const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.quiz_outlined,
                        size: 50,
                        color: Theme.of(context)
                            .colorScheme
                            .primary,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'No quiz attempts yet.',
                      ),
                    ],
                  ),
                ),
              ),

            ...history.map(
                  (item) => Card(
                child: ListTile(
                  leading:
                  const Icon(Icons.quiz),
                  title: Text(item),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}