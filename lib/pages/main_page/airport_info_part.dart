import 'package:dnipro_airport/components/blurred_container.dart';
import 'package:flutter/material.dart';

class AirportInfoPart extends StatelessWidget {
  const AirportInfoPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/airport.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlurredContainer(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our mission',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          """Dnipro International Airport is a large regional airport in Ukraine, an important link in the air transport system that connects Dnipro with 
other cities and countries.
We help to overcome distances. We contribute to the improvement of the individual and the development of society, hometown and country. 
We are proud that we open the sky to the Dnieper and make it possible to fulfill the eternal dream of mankind - to fly.""",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/plan1.png',
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      Text(
                        '1st floor',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/plan2.png',
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      Text(
                        '2nd floor',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
