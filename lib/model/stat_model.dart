import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/const/regions.dart';
import 'package:flutter_fine_dust/model/region_stat_model.dart';

// 시간별 오염도 수치
// List<RegionStatModel> : 지역별 오염도 수치
class StatModel {
  late final List<RegionStatModel> regionStat;
  late final DateTime dataTime;

  StatModel({
    required this.regionStat,
    required this.dataTime,
  });

  StatModel.fromJson({required Map<String, dynamic> json}){
    List<RegionStatModel> list = [];

    for(Region e in Region.values){
      list.add(RegionStatModel(region: e, value: json[e.eng]));
    }

    regionStat = list;
    dataTime = DateTime.parse(json['dataTime']);
  }
}