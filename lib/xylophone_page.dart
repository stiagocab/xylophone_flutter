import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class XylophonePage extends StatefulWidget {
  @override
  _XylophonePageState createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  final _tiles = [
    {"color": Colors.deepOrange},
    {"color": Colors.orange},
    {"color": Colors.yellow},
    {"color": Colors.greenAccent},
    {"color": Colors.green},
    {"color": Colors.blue},
    {"color": Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // decoration: BoxDecoration(color: Colors.purple),
        child: Center(
          child: Column(
            children: _createTiles(),
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      ),
    );
  }

  void _playAudio(int fileNum) {
    final player = AudioCache();
    player.play("note$fileNum.wav");
  }

  List<Widget> _createTiles() {
    List<Widget> listTiles = [];
    int maxTiles = _tiles.length;

    for (int x = 0; x < maxTiles; x++) {
      listTiles.add(Expanded(
        child: FlatButton(
          color: _tiles[x]["color"],
          onPressed: () => _playAudio(x + 1),
          child: null,
        ),
      ));
    }
    return listTiles;
  }
}
