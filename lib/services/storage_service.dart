import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<SharedPreferences> get _prefs async =>
      SharedPreferences.getInstance();

  static Future<void> saveTheme(bool isDark) async {
    final prefs = await _prefs;
    await prefs.setBool('isDark', isDark);
  }

  static Future<bool> getTheme() async {
    final prefs = await _prefs;
    return prefs.getBool('isDark') ?? false;
  }

  static Future<void> saveTotalAttempts(int value) async {
    final prefs = await _prefs;
    await prefs.setInt('totalAttempts', value);
  }

  static Future<int> getTotalAttempts() async {
    final prefs = await _prefs;
    return prefs.getInt('totalAttempts') ?? 0;
  }

  static Future<void> saveHighestScore(int value) async {
    final prefs = await _prefs;
    await prefs.setInt('highestScore', value);
  }

  static Future<int> getHighestScore() async {
    final prefs = await _prefs;
    return prefs.getInt('highestScore') ?? 0;
  }

  static Future<void> saveLastScore(int value) async {
    final prefs = await _prefs;
    await prefs.setInt('lastScore', value);
  }

  static Future<int> getLastScore() async {
    final prefs = await _prefs;
    return prefs.getInt('lastScore') ?? 0;
  }

  static Future<void> saveHistory(List<String> history) async {
    final prefs = await _prefs;
    await prefs.setStringList('history', history);
  }

  static Future<List<String>> getHistory() async {
    final prefs = await _prefs;
    return prefs.getStringList('history') ?? [];
  }
  static Future<void> saveQuizResult(
      int score,
      int totalQuestions,
      ) async {
    final prefs = await _prefs;

    final attempts =
        prefs.getInt('totalAttempts') ?? 0;

    await prefs.setInt(
      'totalAttempts',
      attempts + 1,
    );

    final highest =
        prefs.getInt('highestScore') ?? 0;

    if (score > highest) {
      await prefs.setInt(
        'highestScore',
        score,
      );
    }

    await prefs.setInt(
      'lastScore',
      score,
    );

    final history =
        prefs.getStringList('history') ?? [];

    history.insert(
      0,
      '$score/$totalQuestions',
    );

    if (history.length > 10) {
      history.removeLast();
    }

    await prefs.setStringList(
      'history',
      history,
    );
  }
}