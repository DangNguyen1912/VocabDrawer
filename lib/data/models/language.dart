import 'package:hive/hive.dart';

part 'language.g.dart'; // This will be generated

@HiveType(typeId: 2) // Unique ID for the enum
enum Language {
  @HiveField(0)
  english,
  @HiveField(1)
  french,
}
