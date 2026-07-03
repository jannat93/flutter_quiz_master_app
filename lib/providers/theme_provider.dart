import 'package:flutter/material.dart';

import '../services/storage_service.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  Future<void> loadTheme() async {
    _isDark = await StorageService.getTheme();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;

    await StorageService.saveTheme(_isDark);

    notifyListeners();
  }
}