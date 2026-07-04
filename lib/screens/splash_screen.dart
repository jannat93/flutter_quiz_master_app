import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
          () {
        context.go('/');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/images/logo2.png',
        fit: BoxFit.cover,
      ),
    ),
    );
  }
}