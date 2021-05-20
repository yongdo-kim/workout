import 'package:hive/hive.dart';

part 'hive_history.g.dart';

@HiveType(typeId: 2)
class History {
  @HiveField(0)
  late DateTime dateTIme;
  @HiveField(1)
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
