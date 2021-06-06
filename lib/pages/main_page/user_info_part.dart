import 'package:dnipro_airport/components/blurred_container.dart';
import 'package:flutter/material.dart';

class UserInfoPart extends StatelessWidget {
  const UserInfoPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/user_info_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _InfoCard(
                  image: Image.asset(
                    'assets/images/bag.png',
                    height: 100,
                  ),
                  info: """You can a self-service terminal or at the airport. 

Choose luggage type
Hand luggage can be taken on the plane, and checked baggage (check-in bag) is delivered at the airport.

Arrive on time
To catch a flight, you need to arrive at the airport before check-in, which begins 2 hours before departure.""",
                  label: 'Register',
                ),
                _InfoCard(
                  image: Image.asset(
                    'assets/images/tickets.png',
                    height: 100,
                  ),
                  info:
                      'infoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfo',
                  label: 'Choose luggage type',
                ),
                _InfoCard(
                  image: Image.asset(
                    'assets/images/plane.png',
                    height: 100,
                  ),
                  info:
                      'infoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfoinfo',
                  label: 'Choose luggage type',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Image image;
  final String label;
  final String info;
  const _InfoCard({
    Key? key,
    required this.image,
    required this.info,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurredContainer(
      width: MediaQuery.of(context).size.width / 3.5,
      color: Colors.white38,
      borderRadius: BorderRadius.circular(30.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: image,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(info),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
