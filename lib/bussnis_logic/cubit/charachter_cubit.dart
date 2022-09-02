import 'package:bloc/bloc.dart';
import 'package:flutter_widgets/data/models/chrachterModel.dart';
import 'package:flutter_widgets/data/models/chrachterModel.dart';
import 'package:flutter_widgets/data/models/chrachterModel.dart';
import 'package:flutter_widgets/data/repository/charachter_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/chrachterModel.dart';
import '../../data/models/chrachterModel.dart';

part 'charachter_state.dart';

class CharachterCubit extends Cubit<CharachterState> {
  final Characterrepository characterrepository;
  List<Character> characters = [];

  CharachterCubit(this.characterrepository) : super(CharachterInitial());

  List<Character> getAllCharacters() {
    characterrepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
