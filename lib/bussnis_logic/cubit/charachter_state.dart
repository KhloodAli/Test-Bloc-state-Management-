part of 'charachter_cubit.dart';

@immutable
abstract class CharachterState {}

class CharachterInitial extends CharachterState {}

class CharactersLoaded extends CharachterState {
  final List<Character> characters;

  CharactersLoaded(this.characters);
}

