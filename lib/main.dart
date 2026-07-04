import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/theme_provider.dart';
import 'routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();
  final prefs =
  // await SharedPreferences.getInstance();
  // await prefs.clear();
  await themeProvider.loadTheme();

  runApp(
    ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: const QuizMasterApp(),
    ),
  );
}

class QuizMasterApp extends StatelessWidget {
  const QuizMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Quiz Master',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
          themeProvider.isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}