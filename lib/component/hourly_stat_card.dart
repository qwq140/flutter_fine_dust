import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/component/card_title.dart';
import 'package:flutter_fine_dust/component/status_card.dart';
import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/provider/region_stat_provider.dart';
import 'package:flutter_fine_dust/utils/data_utils.dart';
import 'package:provider/provider.dart';

class HourlyStatCard extends StatelessWidget {
  final ItemCode itemCode;

  const HourlyStatCard({Key? key, required this.itemCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final hourlyStatList = context.watch<RegionStatProvider>().state.stats.where((e) => e.itemCode == itemCode).first.stats;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTitle(title: '시간별 ${itemCode.kor}'),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: hourlyStatList.map((e) {
                    final status = DataUtils.getStatusFromItemCodeAndValue(value: double.parse(e.regionStat.first.value), itemCode: itemCode);
                    return Padding(
                      padding: EdgeInsets.only(right: e == hourlyStatList.last ? 0 : 10),
                      child: StatusCard(
                        title: '${e.dataTime.hour}시',
                        imgUrl: status.imgUrl,
                        level: status.label,
                        stat: '${e.regionStat.first.value}${DataUtils.getUnitFromItemCode(itemCode: itemCode)}',
                      ),
                    );
                  }).toList(),
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
