import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/component/hourly_stat_card.dart';
import 'package:flutter_fine_dust/component/main_app_bar.dart';
import 'package:flutter_fine_dust/component/main_card.dart';
import 'package:flutter_fine_dust/component/now_stat_card.dart';
import 'package:flutter_fine_dust/component/status_card.dart';
import 'package:flutter_fine_dust/const/status_level.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                MainCard(
                  backgroundColor: Colors.lightGreen,
                  child: NowStatCard(),
                ),
                const SizedBox(
                  height: 8,
                ),
                ...ItemCode.values.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: MainCard(
                      backgroundColor: Colors.lightGreen,
                      child: HourlyStatCard(category: e.name),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
