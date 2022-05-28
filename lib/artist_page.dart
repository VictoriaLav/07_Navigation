import 'package:flutter/material.dart';
import 'home_page.dart';
import 'utils.dart';

class Artist {
  late final int id;
  late final String name;
  late final String link;
  late final String about;

  Artist(this.id, this.name, this.link, this.about);

  Artist.fromMap(int i, Map<String, dynamic> json) {
    id = i;
    name = json['name'];
    link = json['link'];
    about = json['about'];
    }
}

class AlbumPage extends StatefulWidget {
  static const routeName = '/album';
  AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  ScrollController controller = ScrollController(); //initialScrollOffset: 0);
  List<Artist> listArtists = readFile('assets/artists.json');
  List<Widget> dataArtists = getData(readFile('assets/artists.json'));

  @override
  void initState() {
    print('init');
    super.initState();
    controller.addListener(() {});
    listArtists = readFile('assets/artists.json');
  }

  @override
  void dispose() {
    print('close');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists'),
      ),
      drawer: DrawerList(),
      body: Center(
        child: ListView(
          controller: controller,
          children: dataArtists.map((item) => item).toList(),
        ),
      ),
    );
  }
}

class ArtistDetailPage extends StatelessWidget {
  static const routeName = '/artist';
  ArtistDetailPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    final artist = listArtists[id];
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
        centerTitle: true,
      ),
      body: Text(artist.about),
    );
  }
}