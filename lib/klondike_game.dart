import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:klondike/components/components.dart';
import 'package:klondike/objects/objects.dart';

class KlondikeGame extends FlameGame {
  static const int allRanks = 13;
  static const int allSuits = 4;
  static const double cardWidth = 1000.0;
  static const double cardHeight = 1400.0;
  static const double cardGap = 175.0;
  static const double cardRadius = 100.0;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);
  static final cardRRect = RRect.fromRectAndRadius(
    const Rect.fromLTWH(0, 0, cardWidth, cardHeight),
    const Radius.circular(cardRadius),
  );
  static int heartCards = 0;
  static int diamondCards = 0;
  static int clubCards = 0;
  static int spadeCards = 0;
  static bool isMuteSound = false;
  @override
  Color backgroundColor() => const Color(0xFF27005D);
  @override
  FutureOr<void> onLoad() async {
    await Flame.images.load('klondike-sprites.png');
    loadAllSFXToCache();
    initializeGame();
  }

  void initializeGame() async {
    final stock = StockPile()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);
    final waste = WastePile()
      ..size = cardSize
      ..position = Vector2(cardWidth + 2 * cardGap, cardGap);
    final foundations = List.generate(
      4,
      (index) => FoundationPile(index)
        ..size = cardSize
        ..position =
            Vector2((index + 3) * (cardWidth + cardGap) + cardGap, cardGap),
    );
    final piles = List.generate(
      7,
      (index) => TableauPile()
        ..size = cardSize
        ..position = Vector2(
            cardGap + index * (cardWidth + cardGap), cardHeight + 2 * cardGap),
    );
    final world = World()
      ..add(stock)
      ..add(waste)
      ..addAll(foundations)
      ..addAll(piles);
    final camera = CameraComponent(world: world)
      ..viewfinder.visibleGameSize =
          Vector2(cardWidth * 7 + cardGap * 8, 4 * cardHeight + 3 * cardGap)
      ..viewfinder.position = Vector2(cardWidth * 3.5 + cardGap * 4, 0)
      ..viewfinder.anchor = Anchor.topCenter;
    addAll([camera, world]);

    final cards = [
      for (var rank = 1; rank <= allRanks; rank++)
        for (var suit = 0; suit < allSuits; suit++) Card(rank, suit)
    ];
    cards.shuffle();
    world.addAll(cards);
    for (var i = 0; i < 7; i++) {
      for (var j = i; j < 7; j++) {
        piles[j].acquireCard(cards.removeLast());
      }
      piles[i].flipTopCard();
    }
    cards.forEach(stock.acquireCard);
    playSFX('shuffle-cards.mp3', isMute: isMuteSound);
  }

  void startNewGame() {
    for (final child in children) {
      child.removeFromParent();
    }
    initializeGame();
  }

  @override
  void update(double dt) {
    super.update(dt);
    final totalCards = heartCards + diamondCards + clubCards + spadeCards;
    if (totalCards == allRanks * allSuits) {
      overlays.remove('Menu');
      overlays.add('Winning');
    }
  }
}

Sprite klondikeSprite(double x, double y, double width, double height) {
  return Sprite(
    Flame.images.fromCache('klondike-sprites.png'),
    srcPosition: Vector2(x, y),
    srcSize: Vector2(width, height),
  );
}
