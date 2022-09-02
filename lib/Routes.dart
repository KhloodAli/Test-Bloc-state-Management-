import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgets/bussnis_logic/cubit/charachter_cubit.dart';
import 'package:flutter_widgets/data/models/chrachterModel.dart';
import 'package:flutter_widgets/data/repository/charachter_repository.dart';
import 'package:flutter_widgets/data/web_services/charachter_web_service.dart';
import 'package:flutter_widgets/presention/Screens/charactersScreen.dart';
import 'package:flutter_widgets/presention/Screens/details_screen.dart';

class APPRouter {
  late Characterrepository charactersRepository;
  late CharachterCubit charachterCubit;

  APPRouter() {
    charactersRepository = Characterrepository(Characterwebservices());
    charachterCubit = CharachterCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charachterCubit,
            child: charactersScreen(),
          ),
        );
      case '/ detailes':
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charachterCubit,
            child: Detailes(character: character),
          ),
        );
    }
  }
}
