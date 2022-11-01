import 'package:flutter_fine_dust/const/regions.dart';
import 'package:flutter_fine_dust/model/stat_list_model.dart';

class RegionStatState {
  final List<StatListModel> stats;
  final Region region;

  RegionStatState({required this.stats, required this.region});

  factory RegionStatState.initial() => RegionStatState(stats: [], region: Region.seoul);

  RegionStatState copyWith({List<StatListModel>? stats, Region? region}) => RegionStatState(stats: stats ?? this.stats, region: region ?? this.region);
}