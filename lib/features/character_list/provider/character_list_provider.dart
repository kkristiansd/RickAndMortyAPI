import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/character_list_view_model.dart';

final characterListProvider =
    StateNotifierProvider<
      CharacterListViewModel,
      AsyncValue<CharacterListState>
    >((ref) => CharacterListViewModel());
