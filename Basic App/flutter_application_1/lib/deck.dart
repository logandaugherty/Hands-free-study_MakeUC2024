class Card {
  late String term;
  late String def;

  int score = 0;
  bool learned = false;

  void scoreIncr() {
    score += 1;
  }

  void scoreDecr() {
    score -= 1;
  }

  bool isLearned() {
    return learned;
  }

  void checkLearned() {
    learned = score >= 5;
  }

  Card(this.term, this.def);
}

class Deck {
  List<Card> deck;
  int index = 0;

  // Constructor that takes an initial card and adds it to the deck
  Deck(Card firstCard) : deck = [firstCard];

  // Additional constructor to initialize with a predefined list of cards
  Deck.withCards(this.deck);

  void addCard(Card input) {
    deck.add(input);
  }

  Card getCard() {
    return deck[index];
  }

  void nextCard() {
    index++;
    if (index >= deck.length) {
      index = 0;
    }
  }

  void resetIndex() {
    this.index = 0;
  }
}
