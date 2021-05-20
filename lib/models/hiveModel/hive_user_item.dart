import 'package:hive/hive.dart';

part 'hive_user_item.g.dart';

//어째선지 여기서 바로 set으로 저장이 안됨
@HiveType(typeId: 3)
class UserItem {
  @HiveField(0)
  late List<String> userItemList;
}
