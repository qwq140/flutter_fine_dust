import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/const/status_level.dart';
import 'package:flutter_fine_dust/model/status_model.dart';

class DataUtils {
  static convertDateTimeToString(DateTime dateTime){
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}';
  }

  static StatusModel getStatusFromItemCodeAndValue({required double value, required ItemCode itemCode}){
    // 1 - 5, 6 -10, 11 - 15
    // seoul의 미세먼지가 7이다.
    // statusLevel 에서 1-5 , 6-10 이 구간이 리스트로 필터링된다.
    // 미세먼지 수치가 클수록 상태는 안좋은 것이고 statusLevel에서 제일 처음이 제일 좋은 상태 마지막이 제일 안좋은 상태
    // 필터링된 리스트에서 마지막을 뽑아내면 현재 공기의 상태가 된다.
    return statusLevel.where((e) {
      if(itemCode == ItemCode.PM10) {
        return e.minFineDust < value;
      } else if(itemCode == ItemCode.PM25){
        return e.minUltraFineDust < value;
      } else if(itemCode == ItemCode.CO){
        return e.minCO < value;
      } else if(itemCode == ItemCode.SO2){
        return e.minSO2 < value;
      } else if(itemCode == ItemCode.O3){
        return e.minO3 < value;
      } else if(itemCode == ItemCode.NO2){
        return e.minNO2 < value;
      } else {
        throw Exception('알수없는 ItemCode입니다.');
      }
    }).last;
  }

  static String getUnitFromItemCode({required ItemCode itemCode}){
    switch(itemCode){
      case ItemCode.PM10 :
      case ItemCode.PM25 :
        return '㎍/㎥';
      default :
        return 'ppm';
    }
  }
}