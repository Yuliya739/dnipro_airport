import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/init_bloc.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitBloc(),
      child: ApiRepo(
        child: child,
      ),
    );
  }
}
