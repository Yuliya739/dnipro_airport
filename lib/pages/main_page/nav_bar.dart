import 'package:dnipro_airport/components/blurred_container.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final List<Widget> actions;

  final double spacing;

  NavBar({
    Key? key,
    required this.actions,
    this.spacing = 10,
  }) : super(key: key);

  final _borderRadius = BorderRadius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FittedBox(
        child: BlurredContainer(
          borderRadius: _borderRadius,
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              children: actions
                  .map(
                    (action) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacing),
                      child: action,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
