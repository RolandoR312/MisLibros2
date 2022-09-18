// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalBookAdapter extends TypeAdapter<LocalBook> {
  @override
  final int typeId = 0;

  @override
  LocalBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalBook()
      ..id = fields[0] as String?
      ..name = fields[1] as String?
      ..author = fields[2] as String?
      ..publishedDate = fields[3] as String?
      ..description = fields[4] as String?
      ..imageLink = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalBook obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.imageLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
