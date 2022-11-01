import 'package:flutter_fine_dust/const/regions.dart';

class RegionState {
  final Region region;

  RegionState({required this.region});

  factory RegionState.initial() => RegionState(region: Region.seoul);

  RegionState copyWith({Region? region}) => RegionState(region: region ?? this.region);

}