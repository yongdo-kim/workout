// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 2;

  @override
  History read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return History()
      ..dateTIme = fields[0] as DateTime
      ..todayGoal = fields[1] as int
      ..setPerQuantityList = (fields[3] as List).cast<int>()
      ..nextGoal = fields[4] as int
      ..setRestTime = fields[5] as int
      ..todaySet = fields[6] as int;
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.dateTIme)
      ..writeByte(1)
      ..write(obj.todayGoal)
      ..writeByte(3)
      ..write(obj.setPerQuantityList)
      ..writeByte(4)
      ..write(obj.nextGoal)
      ..writeByte(5)
      ..write(obj.setRestTime)
      ..writeByte(6)
      ..write(obj.todaySet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
