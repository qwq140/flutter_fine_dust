import 'package:flutter/foundation.dart';
import 'package:flutter_fine_dust/const/regions.dart';
import 'package:flutter_fine_dust/provider/region_state.dart';

class RegionProvider with ChangeNotifier {

  RegionState _state = RegionState.initial();
  RegionState get state => _state;

  void changeRegion({required Region region}){
    _state = state.copyWith(region: region);
    notifyListeners();
  }

}