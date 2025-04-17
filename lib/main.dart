import 'package:around_me_app/theme/light.dart';
import 'package:around_me_app/ui/pages/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: HomeScreen());
  }
}
