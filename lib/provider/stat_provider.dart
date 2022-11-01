import 'package:flutter/foundation.dart';
import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/model/stat_list_model.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';
import 'package:flutter_fine_dust/provider/stat_state.dart';
import 'package:flutter_fine_dust/repository/stat_repository.dart';

class StatProvider with ChangeNotifier{

  StatState _state = StatState.initial();
  StatState get state => _state;

  final StatRepository statRepository;

  StatProvider({required this.statRepository});

  Future<void> fetch() async {
    _state = state.copyWith(status: StatStatus.loading);
    notifyListeners();
    print('로딩');
    /// TODO 통신
    try {
      print('통신시작');
      final List<StatListModel> stats = [];

      List<Future> futures = [];

      for(ItemCode itemCode in ItemCode.values){
        futures.add(statRepository.fetchData(itemCode: itemCode));
      }

      final result = await Future.wait(futures);

      for(int i = 0 ; i<result.length ; i++){

        final itemCode = ItemCode.values[i];
        final statList = result[i];

        final StatListModel statListModel = StatListModel(stats: statList, itemCode: itemCode);

        stats.add(statListModel);
      }

      _state = state.copyWith(stats: stats, status: StatStatus.loaded);
      notifyListeners();
    } catch (e){
      _state = state.copyWith(status: StatStatus.error);
      notifyListeners();
    }
  }

}