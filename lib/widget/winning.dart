import 'package:flutter/material.dart';
import 'package:klondike/klondike.dart';
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
                color: Constant.whiteTextColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            Restart(game: widget.game),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Volume',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Constant.whiteTextColor,
                  ),
                ),
                Mute()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
