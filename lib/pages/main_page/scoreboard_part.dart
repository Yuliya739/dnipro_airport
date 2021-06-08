import 'package:dnipro_airport/models/flight_model.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:flutter/material.dart';

import 'scoreboard.dart';

class ScoreboardPart extends StatelessWidget {
  const ScoreboardPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Theme(
        data: ThemeData.dark(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/scoreboard_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Spacer(),
              Center(
                child: FutureBuilder(
                  future: ApiRepo.of(context).departuresToday(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          textTheme: Theme.of(context).textTheme.apply(
                                fontFamily: 'Skyfont',
                              ),
                        ),
                        child: Scoreboard(
                          data: snapshot.data as List<FlightModel>,
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
