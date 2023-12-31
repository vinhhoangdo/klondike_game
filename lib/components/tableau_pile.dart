import 'dart:ui';

import 'package:flame/components.dart';
import 'package:klondike/components/components.dart';
import 'package:klondike/interface/interface.dart';
import 'package:klondike/klondike.dart';

class TableauPile extends PositionComponent implements Pile {
  TableauPile({super.position}) : super(size: KlondikeGame.cardSize);

  /// Which cards are currently placed onto this pile
  final List<Card> _cards = [];
  final Vector2 _fanOffsetFaceDown = Vector2(0, KlondikeGame.cardHeight * 0.05);
  final Vector2 _fanOffsetOverFlow = Vector2(0, KlondikeGame.cardHeight * 0.15);
  final Vector2 _fanOffsetFaceUp = Vector2(0, KlondikeGame.cardHeight * 0.20);

  @override
  void acquireCard(Card card) {
    card.pile = this;
    card.priority = _cards.length;
    _cards.add(card);
    layOutCards();
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

  void layOutCards() {
    if (_cards.isEmpty) {
      return;
    }
    _cards[0].position.setFrom(position);
    offsetCards();
    height = KlondikeGame.cardHeight * 1.5 + _cards.last.y - _cards.first.y;
    if (height >= KlondikeGame.cardHeight * 3.5) {
      offsetCards(overFlow: true);
    }
  }

  void offsetCards({bool overFlow = false}) {
    for (var i = 1; i < _cards.length; i++) {
      _cards[i].position
        ..setFrom(_cards[i - 1].position)
        ..add(_cards[i - 1].isFaceDown
            ? _fanOffsetFaceDown
            : overFlow
                ? _fanOffsetOverFlow
                : _fanOffsetFaceUp);
    }
  }

  List<Card> cardsOnTop(Card card) {
    assert(card.isFaceUp && _cards.contains(card));
    final index = _cards.indexOf(card);
    return _cards.getRange(index + 1, _cards.length).toList();
  }

  @override
  bool canMoveCard(Card card) => card.isFaceUp;

  @override
  bool canAcceptCard(Card card) {
    if (_cards.isEmpty) {
      return card.rank.value == 13;
    } else {
      final topCard = _cards.last;
      return card.suit.isRed == !topCard.suit.isRed &&
          card.rank.value == topCard.rank.value - 1;
    }
  }

  @override
  void removeCard(Card card) {
    assert(_cards.contains(card) && card.isFaceUp);
    final index = _cards.indexOf(card);
    _cards.removeRange(index, _cards.length);
    if (_cards.isNotEmpty && _cards.last.isFaceDown) {
      flipTopCard();
    }
    layOutCards();
  }

  @override
  void returnCard(Card card) {
    card.priority = _cards.indexOf(card);
    layOutCards();
  }
}
