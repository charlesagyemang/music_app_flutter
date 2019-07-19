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
      Colors.teal,
      Colors.blue,
    ];

    List<Widget> finalKeys = [];

    for(int i = 0; i < 7; i++){
      Expanded expanded = buildKey(colors[i], i + 1);
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
            children: buildKeyLayout(),
          ),
        ),
      ),
    );
  }
}
