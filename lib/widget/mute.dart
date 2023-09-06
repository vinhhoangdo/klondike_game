import 'package:flutter/material.dart';
import 'package:klondike/klondike_game.dart';

class Mute extends StatefulWidget {
  const Mute({super.key});

  @override
  State<Mute> createState() => _MuteState();
}

class _MuteState extends State<Mute> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IconButton(
        icon: KlondikeGame.isMuteSound ? const Icon(
           Icons.volume_off,
          color: Colors.red,
        ) :
        const Icon(
           Icons.volume_up,
          color: Colors.green,
        ),
        onPressed: () {
          setState(() {
            KlondikeGame.isMuteSound = !KlondikeGame.isMuteSound;
          });
        },
      ),
    );
  }
}
