import 'package:flutter/material.dart';

class PlanePart extends StatelessWidget {
  PlanePart();
  final _nameController = TextEditingController();
  final _airlineController = TextEditingController();
  final _kolSeatsController = TextEditingController();

  void _add(BuildContext context) {
    print('_nameController ${_nameController.text}');
    print('_airlineController ${_airlineController.text}');
    print('_kolSeatsController ${_kolSeatsController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'PLANE',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _airlineController,
                    decoration: InputDecoration(labelText: 'Airline id'),
                  ),
                )),
              ],
            ),
            SizedBox(
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _kolSeatsController,
                  decoration: InputDecoration(labelText: 'Number of seats'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () => _add(context),
                child: Text('ADD'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
