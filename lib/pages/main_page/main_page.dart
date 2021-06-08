import 'package:dnipro_airport/pages/main_page/airport_info_part.dart';
import 'package:dnipro_airport/pages/main_page/user_info_part.dart';
import 'package:flutter/material.dart';

import 'nav_bar.dart';
import 'scoreboard_part.dart';
import 'search_part.dart';

class MainPage extends StatelessWidget {
  static String get route => '/main';
  MainPage({Key? key}) : super(key: key);
  final _scrollDuration = Duration(seconds: 1);
  final _scoreboardKey = GlobalKey();
  final _searchKey = GlobalKey();
  final _userInfoKey = GlobalKey();
  final _airportInfoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ScoreboardPart(key: _scoreboardKey),
                SearchPart(key: _searchKey),
                UserInfoPart(key: _userInfoKey),
                Theme(
                  data: ThemeData.dark(),
                  child: AirportInfoPart(key: _airportInfoKey),
                )
              ],
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                height: 80,
              ),
              Spacer(),
              NavBar(
                spacing: 3,
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Scrollable.ensureVisible(
                        _scoreboardKey.currentContext!,
                        duration: _scrollDuration,
                      );
                    },
                    child: Text('Online scoreboard'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Scrollable.ensureVisible(
                        _searchKey.currentContext!,
                        duration: _scrollDuration,
                      );
                    },
                    child: Text('Book tickets'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Scrollable.ensureVisible(
                        _userInfoKey.currentContext!,
                        duration: _scrollDuration,
                      );
                    },
                    child: Text('Information for passengers'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Scrollable.ensureVisible(
                        _airportInfoKey.currentContext!,
                        duration: _scrollDuration,
                      );
                    },
                    child: Text('About the airport'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
