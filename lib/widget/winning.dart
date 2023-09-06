import 'package:flutter/material.dart';
import 'package:klondike/klondike_game.dart';
import 'package:klondike/objects/objects.dart';
import 'package:klondike/widget/widget.dart';

class Winning extends StatefulWidget {
  final KlondikeGame game;
  const Winning({super.key, required this.game});

  @override
  State<Winning> createState() => _WinningState();
}

class _WinningState extends State<Winning> {
  @override
  void initState() {
    playSFX('win.mp3', isMute: KlondikeGame.isMuteSound);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF000000).withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'WOOHOO! YOU WIN!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                widget.game.startNewGame();
                widget.game.overlays.remove('Winning');
                widget.game.overlays.add('Menu');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Restart',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    KlondikeGame.isMuteSound ? 'Sound Off' : 'Sound On',
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  const Mute()
                ],
              ),
            
          ],
        ),
      ),
    );
  }
}
