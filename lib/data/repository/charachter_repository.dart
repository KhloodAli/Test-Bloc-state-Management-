//import 'package:flutter/cupertino.dart';

import '../models/chrachterModel.dart';
import '../web_services/charachter_web_service.dart';

class Characterrepository {
  final Characterwebservices charactersWebServices;

  Characterrepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getallcharachter();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
