import 'package:flutter/material.dart';

class AirportInfoPart extends StatelessWidget {
  const AirportInfoPart({Key? key}) : super(key: key);

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
              image: AssetImage(
                'assets/images/airport.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
