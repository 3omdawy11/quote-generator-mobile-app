// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuoteEntityAdapter extends TypeAdapter<QuoteEntity> {
  @override
  final int typeId = 0;

  @override
  QuoteEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteEntity(
      id: fields[0] as String,
      author: fields[1] as String,
      content: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuoteEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
