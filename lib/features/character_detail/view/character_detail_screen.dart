import 'package:flutter/material.dart';
import '../../character_list/model/character_model.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: const Color(0xFF1C2331),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF1C2331),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                character.image,
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Status with colored dot
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 12,
                  color: character.status == "Alive"
                      ? Colors.green
                      : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  character.status,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Details box
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2E3A59),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                children: [
                  _infoRow("Name", character.name),
                  _infoRow("Species", character.species),
                  _infoRow("Gender", character.gender),
                  _infoRow("Last Known Location", character.origin.name),
                  _infoRow("Location", character.location.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white70),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
