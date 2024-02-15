import 'package:music_player_app/models/song.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({required this.title, required this.songs, required this.imageUrl});

  static List<Playlist> playlist = [
    Playlist(
      title: 'Rock',
      songs: Song.songs,
      imageUrl: 'assets/images/glass.jpg',
    ),
    Playlist(
      title: 'Sertanejo',
      songs: Song.songs,
      imageUrl: 'assets/images/illusions.jpg',
    ),
    Playlist(
      title: 'Eletronica',
      songs: Song.songs,
      imageUrl: 'assets/images/pray.jpg',
    ),
  ];
}
