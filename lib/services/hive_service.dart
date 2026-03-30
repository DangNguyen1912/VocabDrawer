import 'package:hive/hive.dart';
import 'package:vocab_drawer/data/models/word.dart';
import 'package:vocab_drawer/data/models/word_type.dart';
import 'package:vocab_drawer/data/models/words.dart';
import 'package:vocab_drawer/data/models/language.dart';
import 'package:uuid/uuid.dart';

class HiveService {
  static const String _wordsBox = 'words';
  static const String _wordSetsBox = 'wordSets';

  // Get boxes
  Box<Word> get wordsBox => Hive.box<Word>(_wordsBox);
  Box<Map> get wordSetsBox => Hive.box<Map>(_wordSetsBox);

  // CRUD Operations for Words
  Future<Word> addWord({
    required String word,
    String? wordTranslate,
    required WordType wordType,
    String? structure,
    String? example,
    String? exampleTranslate,
  }) async {
    final newWord = Word(
      id: const Uuid().v4(),
      word: word,
      wordTranslate: wordTranslate,
      wordType: wordType,
      structure: structure,
      example: example,
      exampleTranslate: exampleTranslate,
      createdAt: DateTime.now(),
      lastReviewed: null,
    );

    await wordsBox.put(newWord.id, newWord);
    return newWord;
  }

  Future<void> updateWord(Word word) async {
    await wordsBox.put(word.id, word);
  }

  Future<void> deleteWord(String id) async {
    await wordsBox.delete(id);
  }

  Word? getWord(String id) {
    return wordsBox.get(id);
  }

  List<Word> getAllWords() {
    return wordsBox.values.toList();
  }

  List<Word> getWordsByType(WordType type) {
    return wordsBox.values.where((word) => word.wordType == type).toList();
  }

  // CRUD Operations for Word Sets (language pairs)
  Future<String> addWordSet({
    required Language from,
    required Language to,
    required List<String> wordIds,
  }) async {
    final setId = const Uuid().v4();
    final wordsSet = {
      'id': setId,
      'from': from.index,
      'to': to.index,
      'wordIds': wordIds,
      'createdAt': DateTime.now().toIso8601String(),
    };

    await wordSetsBox.put(setId, wordsSet);
    return setId;
  }

  Future<void> updateWordSet(String setId, List<String> wordIds) async {
    final wordsSet = wordSetsBox.get(setId);
    if (wordsSet != null) {
      wordsSet['wordIds'] = wordIds;
      await wordSetsBox.put(setId, wordsSet);
    }
  }

  Future<void> deleteWordSet(String setId) async {
    await wordSetsBox.delete(setId);
  }

  List<Words> getAllWordSets() {
    return wordSetsBox.values.map((set) {
      final wordIds = set['wordIds'] as List;
      final words = wordIds
          .map((id) => wordsBox.get(id))
          .whereType<Word>()
          .toList();

      return Words(
        from: Language.values[set['from']],
        to: Language.values[set['to']],
        words: words,
      );
    }).toList();
  }

  Words? getWordSet(String setId) {
    final set = wordSetsBox.get(setId);
    if (set == null) return null;

    final wordIds = set['wordIds'] as List;
    final words = wordIds
        .map((id) => wordsBox.get(id))
        .whereType<Word>()
        .toList();

    return Words(
      from: Language.values[set['from']],
      to: Language.values[set['to']],
      words: words,
    );
  }

  // Utility Methods
  Future<void> addWordToSet(String setId, String wordId) async {
    final set = wordSetsBox.get(setId);
    if (set != null) {
      final wordIds = List<String>.from(set['wordIds']);
      if (!wordIds.contains(wordId)) {
        wordIds.add(wordId);
        set['wordIds'] = wordIds;
        await wordSetsBox.put(setId, set);
      }
    }
  }

  Future<void> removeWordFromSet(String setId, String wordId) async {
    final set = wordSetsBox.get(setId);
    if (set != null) {
      final wordIds = List<String>.from(set['wordIds']);
      wordIds.remove(wordId);
      set['wordIds'] = wordIds;
      await wordSetsBox.put(setId, set);
    }
  }

  // Search functionality
  List<Word> searchWords(String query) {
    if (query.isEmpty) return [];

    return wordsBox.values.where((word) {
      return word.word.toLowerCase().contains(query.toLowerCase()) ||
          (word.wordTranslate?.toLowerCase().contains(query.toLowerCase()) ??
              false);
    }).toList();
  }
}
