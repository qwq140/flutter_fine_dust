// 순서대로 미세먼지, 초미세먼지, 이산화질소, 오존, 일산화탄소, 이황산가스
import 'package:flutter_fine_dust/const/regions.dart';
import 'package:flutter_fine_dust/model/region_stat_model.dart';

enum ItemCode {
  PM10,
  PM25,
  NO2,
  O3,
  CO,
  SO2
}

class StatModel {
  late final List<RegionStatModel> regionStat;
  late final DateTime dataTime;
  late final ItemCode itemCode;

  StatModel({
    required this.regionStat,
    required this.dataTime,
    required this.itemCode,
  });

  StatModel.fromJson({required Map<String, dynamic> json}){
    List<RegionStatModel> list = [];

    for(Region e in Region.values){
      list.add(RegionStatModel(region: e.eng, value: json[e.eng]));
    }

    regionStat = list;
    dataTime = DateTime.parse(json['dataTime']);
    itemCode = parseItemCodeFromString(json['itemCode']);
  }

  static ItemCode parseItemCodeFromString(String raw){
    if(raw == 'PM2.5'){
      return ItemCode.PM25;
    }

    return ItemCode.values.firstWhere((element) => element.name == raw);
  }

}