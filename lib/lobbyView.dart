import 'package:flutter/material.dart';
import 'package:homeworktwo/quize.dart';

class LobbyView extends StatelessWidget {
  LobbyView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100.0,
                backgroundImage: AssetImage('images/me.jpg')),
          ),
          Text(
            'Lets play a game',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: "berkshireSwash"),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new Quize()));
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('Start Game', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
