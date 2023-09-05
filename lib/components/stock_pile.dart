import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:klondike/components/components.dart';
import 'package:klondike/interface/interface.dart';
import 'package:klondike/klondike.dart';

class StockPile extends PositionComponent with TapCallbacks implements Pile {
  StockPile({super.position}) : super(size: KlondikeGame.cardSize);

  /// Which cards are currently placed onto this pile. The first card
  /// in the list is at the bottom, the last card is on top.
  final List<Card> _cards = [];
  @override
  void acquireCard(Card card) {
    assert(!card.isFaceUp);
    card.pile = this;
    card.position = position;
    card.priority = _cards.length;
    _cards.add(card);
  }

  @override
  void onTapUp(TapUpEvent event) {
    final wastePile = parent!.firstChild<WastePile>()!;
    if (_cards.isEmpty) {
      wastePile.removeAllCards().reversed.forEach((card) {
        card.flip();
        acquireCard(card);
      });
    } else {
      if (_cards.isNotEmpty) {
        final card = _cards.removeLast();
        card.flip();
        wastePile.acquireCard(card);
      }
    }
    super.onTapUp(event);
  }

  final _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = const Color(0xFF3F5B5D);
  final _circlePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 100
    ..color = const Color(0x883F5B5D);

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(KlondikeGame.cardRRect, _borderPaint);
    canvas.drawCircle(
      Offset(width / 2, height / 2),
      KlondikeGame.cardRadius,
      _circlePaint,
    );
    super.render(canvas);
  }

  @override
  bool canMoveCard(Card card) => false;

  @override
  bool canAcceptCard(Card card) => false;

  @override
  void removeCard(Card card) =>
      throw StateError(" Can't remove cards from here!");

  @override
  void returnCard(Card card) =>
      throw StateError(" Can't remove cards from here!");
}
