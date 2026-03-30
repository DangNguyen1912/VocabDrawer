// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordTypeAdapter extends TypeAdapter<WordType> {
  @override
  final int typeId = 1;

  @override
  WordType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WordType.noun;
      case 1:
        return WordType.verb;
      case 2:
        return WordType.adjective;
      case 3:
        return WordType.adverb;
      case 4:
        return WordType.pronoun;
      case 5:
        return WordType.preposition;
      case 6:
        return WordType.conjunction;
      case 7:
        return WordType.interjection;
      case 8:
        return WordType.article;
      default:
        return WordType.noun;
    }
  }

  @override
  void write(BinaryWriter writer, WordType obj) {
    switch (obj) {
      case WordType.noun:
        writer.writeByte(0);
        break;
      case WordType.verb:
        writer.writeByte(1);
        break;
      case WordType.adjective:
        writer.writeByte(2);
        break;
      case WordType.adverb:
        writer.writeByte(3);
        break;
      case WordType.pronoun:
        writer.writeByte(4);
        break;
      case WordType.preposition:
        writer.writeByte(5);
        break;
      case WordType.conjunction:
        writer.writeByte(6);
        break;
      case WordType.interjection:
        writer.writeByte(7);
        break;
      case WordType.article:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
