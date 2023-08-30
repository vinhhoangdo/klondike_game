import 'dart:ui';

import 'package:flame/components.dart';
import 'package:klondike/components/components.dart';
import 'package:klondike/klondike.dart';

class TableauPile extends PositionComponent {
  TableauPile({super.position}) : super(size: KlondikeGame.cardSize);

  /// Which cards are currently placed onto this pile
  final List<Card> _cards = [];
  final Vector2 _fanOffset = Vector2(0, KlondikeGame.cardHeight * 0.05);

  void acquireCard(Card card) {
    if (_cards.isEmpty) {
      card.position = position;
    } else {
      card.position = _cards.last.position + _fanOffset;
    }
    card.priority = _cards.length;
    _cards.add(card);
  }

  final _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = const Color(0x50FFFFFF);

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(KlondikeGame.cardRRect, _borderPaint);
    super.render(canvas);
  }

  void flipTopCard() {
    assert(_cards.last.isFaceDown);
    _cards.last.flip();
  }
}
