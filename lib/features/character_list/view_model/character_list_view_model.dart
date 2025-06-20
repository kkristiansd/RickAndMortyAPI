import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/character_model.dart';

class CharacterListState {
  final List<Character> allCharacters;
  final List<Character> favorites;

  CharacterListState({required this.allCharacters, required this.favorites});

  get length => null;

  CharacterListState copyWith({
    List<Character>? allCharacters,
    List<Character>? favorites,
  }) {
    return CharacterListState(
      allCharacters: allCharacters ?? this.allCharacters,
      favorites: favorites ?? this.favorites,
    );
  }
}

class CharacterListViewModel
    extends StateNotifier<AsyncValue<CharacterListState>> {
  CharacterListViewModel() : super(const AsyncLoading()) {
    _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    try {
      final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character'),
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final characters = CharacterResponse.fromJson(decoded).results;
        state = AsyncData(
          CharacterListState(allCharacters: characters, favorites: []),
        );
      } else {
        state = AsyncError('Failed to load characters', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void toggleFavorite(Character character) {
    state = state.whenData((data) {
      final isFav = data.favorites.contains(character);
      final updatedFavorites = isFav
          ? data.favorites.where((c) => c.id != character.id).toList()
          : [...data.favorites, character];

      return data.copyWith(favorites: updatedFavorites);
    });
  }

  void deleteCharacter(Character character) {
    state = state.whenData((data) {
      final updatedAll = data.allCharacters
          .where((c) => c.id != character.id)
          .toList();
      final updatedFavs = data.favorites
          .where((c) => c.id != character.id)
          .toList();
      return CharacterListState(
        allCharacters: updatedAll,
        favorites: updatedFavs,
      );
    });
  }

  bool isFavorite(Character character) {
    return state.maybeWhen(
      data: (data) => data.favorites.any((c) => c.id == character.id),
      orElse: () => false,
    );
  }
}
