import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yd_workout_program/models/hiveModel/hive_history.dart';
import 'package:yd_workout_program/models/hiveModel/hive_user.dart';
import 'package:yd_workout_program/models/hiveModel/hive_user_item.dart';

Future initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(HistoryAdapter()); //UserItemAdapter
  Hive.registerAdapter(UserItemAdapter());
}
