import 'package:hive/hive.dart';

part 'word_type.g.dart';

@HiveType(typeId: 1)
enum WordType {
  @HiveField(0)
  noun,
  @HiveField(1)
  verb,
  @HiveField(2)
  adjective,
  @HiveField(3)
  adverb,
  @HiveField(4)
  pronoun,
  @HiveField(5)
  preposition,
  @HiveField(6)
  conjunction,
  @HiveField(7)
  interjection,
  @HiveField(8)
  article;

  String get displayName {
    return name[0].toUpperCase() + name.substring(1);
  }
}
