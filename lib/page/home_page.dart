import 'package:flujosentrepantallas/page/animation_page.dart';
import 'package:flujosentrepantallas/page/back_page.dart';
import 'package:flujosentrepantallas/page/character_page.dart';
import 'package:flujosentrepantallas/page/finish_page.dart';
import 'package:flujosentrepantallas/page/information_page.dart';
import 'package:flutter/material.dart';

import 'blank_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('practica'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text('Navigator'),
            children: <Widget>[
              _CustomListTile(
                title: 'Ir a otra pantalla',
                subtitle: 'Ir a otra pantalla y volver',
                leading: Icon(Icons.call_made),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => BlankPage(),
                    ),
                  );
                },
              ),
              _CustomListTile(
                title: 'Ir a otra pantalla',
                subtitle: 'Ir a otra pantalla y volver con información',
                leading: Icon(Icons.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => InformationPage(),
                    ),
                  ).then(
                    (result) => {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Su nombre es:'),
                            content: Text(result),
                          );
                        },
                      ),
                    },
                  );
                },
              ),
              _CustomListTile(
                title: 'Ir a otra pantalla',
                subtitle:
                    'Ir a otra pantalla y volver oprimiendo back unicamente',
                leading: Icon(Icons.close),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => BackPage(),
                    ),
                  );
                },
              ),
              _CustomListTile(
                title: 'Ir a otra pantalla',
                subtitle: 'Ir a otra pantalla y volver con animación',
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Hero(
                    tag: 'dash',
                    child: Image.asset('assets/conejito.png'),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AnimationPage(),
                    ),
                  );
                },
              ),
              _CustomListTile(
                title: 'Ir a otra pantalla',
                subtitle: 'Ir a otra pantalla y cerrar todo',
                leading: Icon(Icons.close),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => FinishPage(),
                      ),
                      (route) => false);
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Async'),
            children: <Widget>[
              _CustomListTile(
                title: 'Personajes',
                subtitle: 'Personajes de Harry Potter',
                leading: Icon(Icons.group),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CharacterPage(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final GestureTapCallback onTap;

  _CustomListTile({this.title, this.subtitle, this.leading, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: leading,
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
