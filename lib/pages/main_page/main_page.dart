import 'package:dnipro_airport/pages/scoreboard_page/scoreboard_page.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static String get route => '/main';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScoreboardPart(),
          ],
        ),
      ),
    );
  }
}

class ScoreboardPart extends StatelessWidget {
  const ScoreboardPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 700, maxHeight: 700),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/scoreboard_background.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => ApiRepo.of(context).test(),
                child: Text('test'),
              )
            ],
          )
        ],
      ),
    );
  }
}
