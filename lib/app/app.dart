import 'package:dnipro_airport/pages/main_page/main_page.dart';
import 'package:dnipro_airport/pages/scoreboard_page/scoreboard_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme(
          primary: Colors.white,
          primaryVariant: Colors.white70,
          secondary: Colors.white,
          secondaryVariant: Colors.white70,
          surface: Colors.white,
          background: Colors.black38,
          error: Colors.red,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            shadowColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
          ),
        ),
      ),
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (_) => MainPage(),
        ScoreboardPage.route: (_) => ScoreboardPage(),
      },
    );
  }
}
