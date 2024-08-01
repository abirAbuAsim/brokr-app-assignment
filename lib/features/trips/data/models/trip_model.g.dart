// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripModelAdapter extends TypeAdapter<TripModel> {
  @override
  final int typeId = 0;

  @override
  TripModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripModel(
      id: fields[0] as int,
      title: fields[1] as String,
      photos: (fields[2] as List).cast<String>(),
      description: fields[3] as String,
      rating: fields[4] as String,
      count: fields[5] as String,
      amount: fields[6] as String,
      date: fields[7] as DateTime,
      location: fields[8] as String,
      isTopHost: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TripModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.photos)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.count)
      ..writeByte(6)
      ..write(obj.amount)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.isTopHost);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
