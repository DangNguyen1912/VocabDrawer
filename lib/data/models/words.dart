// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vocab_drawer/data/models/language.dart';
import 'package:vocab_drawer/data/models/word.dart';

class Words {
  Language from;
  Language to;
  List<Word> words;
  Words({required this.from, required this.to, required this.words});
}
