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
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  int attempts = 0;
  int highestScore = 0;
  int lastScore = 0;
  List<String> history = [];

  @override
  void initState() {
    super.initState();
    loadStats();
  }

  Future<void> loadStats() async {
    attempts =
    await StorageService.getTotalAttempts();

    highestScore =
    await StorageService.getHighestScore();

    lastScore =
    await StorageService.getLastScore();

    history =
    await StorageService.getHistory();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider =
    Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Quiz Master"),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: Icon(
              themeProvider.isDark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          )
        ],
      ),
      body: ListView(
        padding:
        const EdgeInsets.all(16),
        children: [
          const Text(
            "Welcome to Quiz Master!",
            style: TextStyle(
              fontSize: 24,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Test your knowledge and improve your learning skills.",
          ),

          const SizedBox(height: 20),

          const Text(
            "Statistics",
            style: TextStyle(
              fontSize: 20,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics:
            const NeverScrollableScrollPhysics(),
            childAspectRatio: 1,
            children: [
              StatCard(
                title: "Attempts",
                value:
                attempts.toString(),
                icon: Icons.repeat,
              ),
              StatCard(
                title: "Highest",
                value:
                highestScore.toString(),
                icon: Icons.star,
              ),
              StatCard(
                title: "Last",
                value:
                lastScore.toString(),
                icon: Icons.history,
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          GridView.builder(
            shrinkWrap: true,
            physics:
            const NeverScrollableScrollPhysics(),
            itemCount:
            quizCategories.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder:
                (context, index) {
              final category =
              quizCategories[index];

              return CategoryCard(
                title: category.name,
                icon: category.icon,
                questionCount: category
                    .questions.length,
                onTap: () {
                  context.push(
                    '/quiz',
                    extra: category,
                  );
                },
              );
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "Recent History",
            style: TextStyle(
              fontSize: 20,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          if (history.isEmpty)
            const Text(
              "No quiz attempts yet",
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
    );
  }
}