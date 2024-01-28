import 'package:flutter/cupertino.dart';
import 'package:shop_schedule/model/shop_schedule.dart';

class ShopProvider with ChangeNotifier {
  ShopSchedule schedule = ShopSchedule();

  setShopSchedule(ShopSchedule data) {
    schedule = data;
    notifyListeners();
  }

  clearBranchSchedule() {
    schedule = ShopSchedule();
    notifyListeners();
  }
}
