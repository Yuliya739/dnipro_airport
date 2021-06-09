import 'package:dnipro_airport/bloc/search_bloc.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageProvider extends StatelessWidget {
  final Widget child;
  final ApiRepo apiRepo;

  const SearchPageProvider({
    Key? key,
    required this.child,
    required this.apiRepo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(apiRepo: apiRepo),
      child: child,
    );
  }
}
