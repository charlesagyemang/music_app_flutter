import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound (int sound) {
    final player = AudioCache();
    player.play('note$sound.wav');
  }

  Expanded buildKey(Color colors, int int) {
    return Expanded(
      child: FlatButton(
        color: colors,
        onPressed: () {
          playSound(int);
        },
      ),
    );
  }

  List<Widget> buildKeyLayout(){
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.indigo,
      Colors.indigoAccent,
    ];

    List<Widget> finalKeys = [];

    for(int i = 0; i < 8; i++){
      Expanded expanded = buildKey(colors[i], i);
      finalKeys.add(expanded);
    }

    return finalKeys;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(Colors.red,1),
              buildKey(Colors.orange,2),
              buildKey(Colors.yellow,3),
              buildKey(Colors.green,4),
              buildKey(Colors.teal,5),
              buildKey(Colors.blue,6),
              buildKey(Colors.purple,7),
            ]
          ),
        ),
      ),
    );
  }
}