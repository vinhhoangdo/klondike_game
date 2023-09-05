import 'package:flame/components.dart';
import 'package:klondike/components/components.dart';
import 'package:klondike/interface/interface.dart';
import 'package:klondike/klondike.dart';

class WastePile extends PositionComponent implements Pile {
  WastePile({super.position}) : super(size: KlondikeGame.cardSize);
  final List<Card> _cards = [];

  @override
  void acquireCard(Card card) {
    assert(card.isFaceUp);
    card.pile = this;
    card.position = position;
    card.priority = _cards.length;
    _cards.add(card);
    _fanOutTopCards();
  }

  void _fanOutTopCards() {
    for (final card in _cards) {
      card.position = position;
    }
  }

  List<Card> removeAllCards() {
    final cards = _cards.toList();
    _cards.clear();
    return cards;
  }

  @override
  bool canMoveCard(Card card) => _cards.isNotEmpty && card == _cards.last;

  @override
  bool canAcceptCard(Card card) => false;

  @override
  void removeCard(Card card) {
    assert(canMoveCard(card));
    _cards.removeLast();
    _fanOutTopCards();
  }

  @override
  void returnCard(Card card) {
    card.priority = _cards.indexOf(card);
    _fanOutTopCards();
  }
}
