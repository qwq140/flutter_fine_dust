import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';

// 코드 별 오염도 수치
class StatListModel {
  final List<StatModel> stats;
  final ItemCode itemCode;

  StatListModel({required this.stats, required this.itemCode});

  static ItemCode parseItemCodeFromString(String itemCode) {
    return ItemCode.values.firstWhere((element) => element.eng == itemCode);
  }
}