import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/component/main_app_bar.dart';
import 'package:flutter_fine_dust/component/main_card.dart';
import 'package:flutter_fine_dust/component/now_stat_card.dart';
import 'package:flutter_fine_dust/component/status_card.dart';
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
