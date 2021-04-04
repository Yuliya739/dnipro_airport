import 'package:flutter/material.dart';

class ScoreboardPage extends StatelessWidget {
  static String get route => '/scoreboard';
  const ScoreboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Scoreboard'),
      ),
    );
  }
}
