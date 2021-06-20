import 'package:dnipro_airport/pages/admin_page/airline/bloc/airline_bloc.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPageProvider extends StatelessWidget {
  final Widget child;
  const AdminPageProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AirlineBloc(
            ApiRepo(
              child: Container(),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
