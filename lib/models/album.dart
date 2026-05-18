class Album {
  final int id;
  final String title;
  final String artist;
  final int year;
  final String genre;
  final String label;
  final String coverUrl;
  final List<String> tracks;
  final String description;

  const Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.year,
    required this.genre,
    required this.label,
    required this.coverUrl,
    required this.tracks,
    required this.description,
  });

  factory Album.fromMap(Map<String, dynamic> map) => Album(
        id: map['id'],
        title: map['title'],
        artist: map['artist'],
        year: map['year'],
        genre: map['genre'],
        label: map['label'],
        coverUrl: map['coverUrl'],
        tracks: List<String>.from(map['tracks']),
        description: map['description'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'artist': artist,
        'year': year,
        'genre': genre,
        'label': label,
        'coverUrl': coverUrl,
        'tracks': tracks,
        'description': description,
      };
}
