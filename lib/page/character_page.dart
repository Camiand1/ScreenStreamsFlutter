import 'dart:convert';

import 'package:flujosentrepantallas/model/character_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'character_detail_page.dart';

class CharacterPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  Future<List<CharacterResponse>> charactersFuture;

  @override
  void initState() {
    super.initState();
    charactersFuture = getCharactersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¨Personajes'),
      ),
      body: Center(
        child: FutureBuilder<List<CharacterResponse>>(
          future: charactersFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: (snapshot.data
                    .map((character) => _CharacterItem(
                          characterResponse: character,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CharacterDetailPage(
                                  character: character,
                                ),
                              ),
                            );
                          },
                        ))
                    .toList()),
              );
            } else if (snapshot.hasError) {
              return Text('Error');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<List<CharacterResponse>> getCharactersData() async {
    final response =
        await http.get('http://hp-api.herokuapp.com/api/characters');
    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List;
      var characters = list.map((i) => CharacterResponse.fromJson(i)).toList();
      return characters;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class _CharacterItem extends StatelessWidget {
  final CharacterResponse characterResponse;
  final GestureTapCallback onTap;

  _CharacterItem({this.characterResponse, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(characterResponse.image ?? ''),
                radius: 30.0,
              ),
            ),
            Text(characterResponse.name),
          ],
        ),
      ),
    );
  }
}
