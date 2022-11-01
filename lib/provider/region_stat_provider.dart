import 'package:flutter_fine_dust/const/regions.dart';
import 'package:flutter_fine_dust/model/stat_list_model.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';
import 'package:flutter_fine_dust/provider/region_provider.dart';
import 'package:flutter_fine_dust/provider/region_stat_state.dart';
import 'package:flutter_fine_dust/provider/stat_provider.dart';

class RegionStatProvider {

  final RegionProvider regionProvider;
  final StatProvider statProvider;

  RegionStatProvider({required this.regionProvider, required this.statProvider});

  RegionStatState get state {
    Region recentRegion = regionProvider.state.region;
    List<StatListModel> stats = statProvider.state.stats;
    List<StatListModel> regionStats = [];

    for(StatListModel statListModel in stats){
      List<StatModel> statModelList = statListModel.stats.map((statModel) => StatModel(regionStat: [statModel.regionStat.firstWhere((regionStatModel) => regionStatModel.region == recentRegion)], dataTime: statModel.dataTime)).toList();
      StatListModel temp = StatListModel(stats: statModelList, itemCode: statListModel.itemCode);
      regionStats.add(temp);
    }

    return RegionStatState(stats: regionStats, region: recentRegion);
  }

}