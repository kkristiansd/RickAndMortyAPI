import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/character_list/model/character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onFavorite;
  final VoidCallback onDelete;

  const CharacterCard({
    required this.character,
    required this.onFavorite,
    required this.onDelete,
    required bool isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2E3A59),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                character.image,
                width: 100,
                height: double.infinity, // fill vertically
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    character.species,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    character.status,
                    style: TextStyle(
                      color: character.status == "Alive"
                          ? Colors.green
                          : Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 22,
                    color: Colors.white70,
                  ),
                  onPressed: onFavorite,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 22,
                    color: Colors.white70,
                  ),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
