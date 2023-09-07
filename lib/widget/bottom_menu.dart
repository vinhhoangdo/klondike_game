import 'package:flutter/material.dart';
import 'package:klondike/klondike.dart';
import 'package:klondike/widget/mute.dart';
import 'package:klondike/widget/restart.dart';

class BottomMenu extends StatelessWidget {
  final KlondikeGame game;
  const BottomMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Constant.transparentColor,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Constant.bottomMenuBackground,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Mute(),
              Restart(game: game),
            ],
          ),
        ),
      ),
    );
  }
}
