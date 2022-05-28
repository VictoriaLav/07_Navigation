import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'artist_page.dart';
import 'fetch_file.dart';

String loadString = '';
Map<String, dynamic> jsonResponse = {};
List<Artist> listArtists = [];

List<Artist> readFile(nameFile) {
  getLoadString(nameFile);
  List<dynamic> json = [];
  try {
    json = jsonDecode(loadString);
  } catch (e) {}

  int id = -1;
  listArtists = json.map((item)
  {
    id++;
    return Artist.fromMap(id, item);
  }).toList();
  return listArtists;
}

void getLoadString(String nameFile) async {
  // loadString = await rootBundle.loadString(nameFile);
  loadString = await fetchFileFromAssets(nameFile);
}

List<Widget> getData(List<Artist> listArtists) {
  List<Widget> listWidget = [];
  for (var item in listArtists) {
    listWidget.add(
      ArtistCard(id: item.id)
    );
  }
  return listWidget;
}

class ArtistCard extends StatefulWidget {
  ArtistCard({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final artist = listArtists[widget.id];
    return Container(
      width: double.infinity,
      child: ListTile(
        title: Text(artist.name),
        onTap: () {
          Navigator.of(context).pushNamed('/artist', arguments: {'id': widget.id});
        },
      ),
    );
  }
}
