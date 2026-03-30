// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vocab_drawer/data/models/language.dart';
import 'package:vocab_drawer/data/models/word.dart';

class Words {
  Language from;
  Language to;
  List<Word> words;
  Words({required this.from, required this.to, required this.words});

  List<Word> alphaOrderedWords() {
    var wordsTemp = List<Word>.from(words);
    wordsTemp.sort((a, b) {
      int wordComparison = a.word.compareTo(b.word);
      if (wordComparison != 0) return wordComparison;

      if (a.wordTranslate == null && b.wordTranslate == null) return 0;
      if (a.wordTranslate == null) return 1;
      if (b.wordTranslate == null) return -1;
      return a.wordTranslate!.compareTo(b.wordTranslate!);
    });
    return wordsTemp;
  }

  Map<String, dynamic> toMap() {
    return {
      'from': from.index,
      'to': to.index,
      'words': words.map((w) => w.id).toList(), // Store only IDs
    };
  }

  static Words fromMap(Map<String, dynamic> map, List<Word> allWords) {
    return Words(
      from: Language.values[map['from']],
      to: Language.values[map['to']],
      words: allWords
          .where((w) => (map['words'] as List).contains(w.id))
          .toList(),
    );
  }
}
