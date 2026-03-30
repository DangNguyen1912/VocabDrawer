import 'package:hive/hive.dart';
import 'package:vocab_drawer/data/models/word_type.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String word;

  @HiveField(2)
  final String? wordTranslate;

  @HiveField(3)
  final WordType wordType;

  @HiveField(4)
  final String? structure;

  @HiveField(5)
  final String? example;

  @HiveField(6)
  final String? exampleTranslate;

  @HiveField(7)
  final DateTime createdAt;

  @HiveField(8)
  final DateTime? lastReviewed;

  Word({
    required this.id,
    required this.word,
    this.wordTranslate,
    required this.wordType,
    this.structure,
    this.example,
    this.exampleTranslate,
    required this.createdAt,
    this.lastReviewed,
  });
}
