// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..point = fields[1] as int
      ..todayGoal = fields[2] as int
      ..setPerQuantityList = (fields[3] as List).cast<int>()
      ..nextGoal = fields[4] as int
      ..setRestTime = fields[5] as int
      ..todaySet = fields[6] as int;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.point)
      ..writeByte(2)
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
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
