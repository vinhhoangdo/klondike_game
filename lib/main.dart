import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:klondike/widget/bottom_menu.dart';
import 'package:klondike/widget/winning.dart';
import 'klondike_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  runApp(
    GameWidget<KlondikeGame>.controlled(
      gameFactory: KlondikeGame.new,
      mouseCursor: SystemMouseCursors.grab,
      overlayBuilderMap: {
        'Menu': (_, game) => BottomMenu(game: game),
        'Winning': (_, game) => Winning(game: game),
      },
      initialActiveOverlays: const ['Menu'],
    ),
  );
}
