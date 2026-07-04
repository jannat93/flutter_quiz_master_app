import 'package:go_router/go_router.dart';

import '../models/quiz_category.dart';
import '../screens/history_details_screen.dart';
import '../screens/home_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/result_screen.dart';
import '../screens/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (_, __) =>
      const SplashScreen(),
    ),
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
          reviews: List<Map<String, dynamic>>.from(
            data['reviews'],
          ),
        );
      },
    ),
    GoRoute(
      path: '/history',
      builder: (_, state) {
        return HistoryDetailsScreen(
          history: state.extra
          as Map<String, dynamic>,
        );
      },
    ),
  ],
);