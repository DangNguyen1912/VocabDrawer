// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordAdapter extends TypeAdapter<Word> {
  @override
  final int typeId = 0;

  @override
  Word read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Word(
      id: fields[0] as String,
      word: fields[1] as String,
      wordTranslate: fields[2] as String?,
      wordType: fields[3] as WordType,
      structure: fields[4] as String?,
      example: fields[5] as String?,
      exampleTranslate: fields[6] as String?,
      createdAt: fields[7] as DateTime,
      lastReviewed: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.word)
      ..writeByte(2)
      ..write(obj.wordTranslate)
      ..writeByte(3)
      ..write(obj.wordType)
      ..writeByte(4)
      ..write(obj.structure)
      ..writeByte(5)
      ..write(obj.example)
      ..writeByte(6)
      ..write(obj.exampleTranslate)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.lastReviewed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
