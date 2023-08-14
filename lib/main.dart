import 'package:bloc_project/screens/counter_page.dart';
import 'package:bloc_project/screens/dashboard.dart';
import 'package:bloc_project/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(BytebankApp());
}

final ThemeData themeBank = ThemeData();

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeBank,
      home: CounterPage(),
    );
  }
}
