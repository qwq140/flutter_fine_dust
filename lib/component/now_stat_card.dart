import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/component/card_title.dart';
import 'package:flutter_fine_dust/component/status_card.dart';
import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/model/stat_list_model.dart';
import 'package:flutter_fine_dust/provider/region_stat_provider.dart';
import 'package:flutter_fine_dust/utils/data_utils.dart';
import 'package:provider/provider.dart';

class NowStatCard extends StatelessWidget {
  const NowStatCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {

      List<StatListModel> stats = context.watch<RegionStatProvider>().state.stats;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CardTitle(title: '현재 공기 상태'),
                const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 16,
                  indent: 16,
                  color: Colors.white,
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    children: stats.map(
                      (e) {
                        final status = DataUtils.getStatusFromItemCodeAndValue(value: double.parse(e.stats.first.regionStat.first.value), itemCode: e.itemCode);
                        return StatusCard(
                          title: e.itemCode.kor,
                          imgUrl: status.imgUrl,
                          level: status.label,
                          stat: '${e.stats.first.regionStat.first.value}${DataUtils.getUnitFromItemCode(itemCode: e.itemCode)}',
                          width: constraint.maxWidth / 3,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
