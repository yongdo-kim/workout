// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserItemAdapter extends TypeAdapter<UserItem> {
  @override
  final int typeId = 3;

  @override
  UserItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserItem()..userItemList = (fields[0] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, UserItem obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.userItemList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
