import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/model/stat_list_model.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';
import 'package:flutter_fine_dust/model/status_model.dart';
import 'package:flutter_fine_dust/provider/region_stat_provider.dart';
import 'package:flutter_fine_dust/provider/theme_provider.dart';
import 'package:flutter_fine_dust/utils/data_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget {

  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700);

    StatListModel statListModel = context.watch<RegionStatProvider>().state.stats.firstWhere((e) => e.itemCode == ItemCode.PM10);
    StatModel stat = statListModel.stats.first;

    StatusModel status = DataUtils.getStatusFromItemCodeAndValue(value: double.parse(stat.regionStat.first.value), itemCode: statListModel.itemCode);

    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.width + 56,
      backgroundColor: context.watch<ThemeProvider>().state.primaryColor,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight),
              Text(stat.regionStat.first.region.kor, style: ts),
              const SizedBox(height: 8,),
              Text(DataUtils.convertDateTimeToString(stat.dataTime), style: ts.copyWith(fontSize: 20, fontWeight: FontWeight.w300),),
              const SizedBox(height: 20,),
              SvgPicture.asset(status.imgUrl, width: MediaQuery.of(context).size.width/3, color: Colors.white,),
              const SizedBox(height: 20,),
              Text(status.label, style: ts,),
              const SizedBox(height: 8,),
              Text(status.comment, style: ts.copyWith(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
