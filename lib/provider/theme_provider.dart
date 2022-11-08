import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/model/stat_list_model.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';
import 'package:flutter_fine_dust/model/status_model.dart';
import 'package:flutter_fine_dust/provider/region_stat_provider.dart';
import 'package:flutter_fine_dust/provider/theme_state.dart';
import 'package:flutter_fine_dust/utils/data_utils.dart';

class ThemeProvider {

  final RegionStatProvider regionStatProvider;

  ThemeProvider({required this.regionStatProvider});

  // 테마 색상은 미세먼지를 기준으로 한다.
  // regionStatProvider.state.stats : 현재 선택된 지역의 ItemCode 별 오염도 리스트
  ThemeState get state {
    StatListModel statListModel = regionStatProvider.state.stats.firstWhere((e) => e.itemCode == ItemCode.PM10);
    // 제일 최근 Stat
    StatModel stat = statListModel.stats.first;

    StatusModel status = DataUtils.getStatusFromItemCodeAndValue(value: double.parse(stat.regionStat.first.value), itemCode: statListModel.itemCode);

    Color primaryColor = status.primaryColor;
    Color subColor = status.subColor;
    Color fontColor = status.fontColor;

    return ThemeState(primaryColor: primaryColor, subColor: subColor, textColor: fontColor);
  }
}