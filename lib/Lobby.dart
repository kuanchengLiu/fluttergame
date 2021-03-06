import 'package:flutter/material.dart';
import 'package:homeworktwo/lobbyView.dart';
import 'package:sqflite/sqflite.dart';

class Lobby extends StatelessWidget {
  // This widget is the root of your application.
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(title: const Text(_title)),
          body: LobbyView(),
        ));
  }

  
}
