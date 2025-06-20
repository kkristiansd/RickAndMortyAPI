class CharacterResponse {
  final List<Character> results;

  CharacterResponse({required this.results});

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    return CharacterResponse(
      results: (json['results'] as List)
          .map((e) => Character.fromJson(e))
          .toList(),
    );
  }
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final CharacterLocation origin;
  final CharacterLocation location;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
      origin: CharacterLocation.fromJson(json['origin']),
      location: CharacterLocation.fromJson(json['location']),
    );
  }
}

class CharacterLocation {
  final String name;
  final String url;

  CharacterLocation({
    required this.name,
    required this.url,
  });

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(
      name: json['name'],
      url: json['url'],
    );
  }
}
