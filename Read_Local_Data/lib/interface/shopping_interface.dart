class shopping {
  final List<Crossword> item;

  const shopping(this.item);
}

class Crossword {
  final String name;
  final Across across;

  Crossword(this.name, this.across);
}

class Across {
  final List<Word> words;

  const Across(this.words);
}

class Word {
  final int number;
  final String word;

  const Word(this.number, this.word);
}