import 'package:go_router/go_router.dart';

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
      builder: (_, __) => const QuizScreen(),
    ),
    GoRoute(
      path: '/result',
      builder: (_, __) => const ResultScreen(),
    ),
  ],
);