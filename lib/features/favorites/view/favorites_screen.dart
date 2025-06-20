import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/character_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../character_list/provider/character_list_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(characterListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: const Color(0xFF1C2331),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF1C2331),
      body: state.when(
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Colors.white)),
        error: (err, _) => Center(
          child: Text('Error: $err', style: TextStyle(color: Colors.white)),
        ),
        data: (data) {
          final favorites = data.favorites;
          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet.',
                style: TextStyle(color: Colors.white70),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.4,
            ),
            itemBuilder: (context, index) {
              final character = favorites[index];
              final viewModel = ref.read(characterListProvider.notifier);
              final isFav = viewModel.isFavorite(character);

              return CharacterCard(
                character: character,
                onFavorite: () => viewModel.toggleFavorite(character),
                onDelete: () => viewModel.deleteCharacter(character),
                isFavorite: isFav,
              );
            },
          );
        },
      ),
    );
  }
}
