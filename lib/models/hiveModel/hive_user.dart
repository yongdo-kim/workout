import 'package:hive/hive.dart';

part 'hive_user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(1)
  late int point;
  @HiveField(2)
  late int todayGoal;
  @HiveField(3)
  late List<int> setPerQuantityList;
  @HiveField(4)
  late int nextGoal;
  @HiveField(5)
  late int setRestTime;
  @HiveField(6)
  late int todaySet;
}
