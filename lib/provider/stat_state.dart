import 'package:flutter_fine_dust/const/regions.dart';
import 'package:flutter_fine_dust/model/stat_list_model.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';

// 진행 상태
enum StatStatus {
  initial,
  loading,
  loaded,
  error,
}

class StatState {
  final List<StatListModel> stats;
  final StatStatus status;

  StatState({required this.stats, required this.status});

  factory StatState.initial() => StatState(stats: [], status: StatStatus.initial);

  StatState copyWith({List<StatListModel>? stats, StatStatus? status}) => StatState(stats: stats ?? this.stats, status: status ?? this.status);

}