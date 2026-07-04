import 'package:go_router/go_router.dart';

import '../models/quiz_category.dart';
import '../screens/home_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/result_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/quiz',
      builder: (_, state) => QuizScreen(
        category: state.extra
        as QuizCategory,
      ),
    ),
    GoRoute(
      path: '/result',
      builder: (_, state) {
        final data =
        state.extra as Map<String, dynamic>;

        return ResultScreen(
          score: data['score'],
          totalQuestions: data['total'],
          category: data['category'],
        );
      },
    ),
  ],
);