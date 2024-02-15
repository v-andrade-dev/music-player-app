import 'package:flutter/material.dart';
import 'package:music_player_app/models/playlist.dart';
import 'package:music_player_app/models/song.dart';
import 'package:music_player_app/widgets/custom_appbar.dart';
import 'package:music_player_app/widgets/playlist_card.dart';
import 'package:music_player_app/widgets/section_header.dart';
import 'package:music_player_app/widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlist;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: CustomAppBar(),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.deepPurple.shade800,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            //showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: "Favoritas"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_outlined), label: "Play"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_outlined), label: "Profile"),
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            const _DiscoveryMusic(),
            _LastSongs(songs: songs),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SectionHeader(title: "Playlists", action: "Ver mais"),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: playlists.length,
                      itemBuilder: (context, index) {
                        return PlaylistCard(playlist: playlists[index]);
                      })
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _DiscoveryMusic extends StatelessWidget {
  const _DiscoveryMusic({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bem Vindo',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Text('Ouça suas musicas favoritas',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Pesquisar',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none))),
        ],
      ),
    );
  }
}

class _LastSongs extends StatelessWidget {
  const _LastSongs({Key? key, required this.songs});
  final List<Song> songs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: SectionHeader(title: "Ultimas ouvidas", action: "Ver Mais"),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.27,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              }),
        ),
      ],
    );
  }
}
