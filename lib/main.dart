import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:klondike/widget/restart.dart';
import 'package:klondike/widget/winning.dart';
import 'klondike_game.dart';

void main() {
  runApp(
    GameWidget<KlondikeGame>.controlled(
      gameFactory: KlondikeGame.new,
      mouseCursor: SystemMouseCursors.grab,
      overlayBuilderMap: {'Restart': (_, game) => Restart(game: game),
      'Winning': (_, game) => Winning(game: game)},
      initialActiveOverlays: const ['Restart'],
    ),
  );
}
