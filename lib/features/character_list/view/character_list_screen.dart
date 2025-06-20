import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/character_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/character_list_provider.dart';

class CharacterListScreen extends ConsumerWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState = ref.watch(characterListProvider);
    final viewModel = ref.read(characterListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        backgroundColor: const Color(0xFF1C2331),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF1C2331),
      body: characterState.when(
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Colors.white)),
        error: (err, _) => Center(
          child: Text(
            'Error: $err',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        data: (characters) => GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3.4,
          ),
          itemCount: characters.allCharacters.length,
          itemBuilder: (context, index) {
            final character = characters.allCharacters[index];

            final isFavorite = viewModel.isFavorite(character);

            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: character);
              },
              child: CharacterCard(
                character: character,
                onFavorite: () => viewModel.toggleFavorite(character),
                onDelete: () => viewModel.deleteCharacter(character),
                isFavorite: isFavorite,
              ),
            );
          },
        ),
      ),
    );
  }
}
