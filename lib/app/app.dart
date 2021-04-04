import 'package:dnipro_airport/pages/main_page/main_page.dart';
import 'package:dnipro_airport/pages/scoreboard_page/scoreboard_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (_) => MainPage(),
        ScoreboardPage.route: (_) => ScoreboardPage(),
      },
    );
  }
}
