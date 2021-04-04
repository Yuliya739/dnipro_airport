import 'package:dnipro_airport/pages/scoreboard_page/scoreboard_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static String get route => '/main';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Main page'),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ScoreboardPage.route),
              child: Text('Scoreboard'),
            )
          ],
        ),
      ),
    );
  }
}
