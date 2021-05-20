import 'package:flutter/material.dart';
import 'package:yd_workout_program/services/shop_service.dart';
import 'package:yd_workout_program/untils/router/locator.dart';

class StorageViewModel extends ChangeNotifier {
  final ShopService _shopService = getIt<ShopService>();

  List<String> get totalSetItem => _totalSetItem;
  List<String> _totalSetItem = [];

  Map<String, ItemStatus> get itemMap => _itemMap;
  Map<String, ItemStatus> _itemMap = {};

  Future initialize() async{
    await _shopService.getUserItem();
    _itemMap = _shopService.itemMap;
    notifyListeners();
  }
}
