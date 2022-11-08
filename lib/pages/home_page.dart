import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/component/hourly_stat_card.dart';
import 'package:flutter_fine_dust/component/main_app_bar.dart';
import 'package:flutter_fine_dust/component/main_card.dart';
import 'package:flutter_fine_dust/component/now_stat_card.dart';
import 'package:flutter_fine_dust/component/status_card.dart';
import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/const/regions.dart';
import 'package:flutter_fine_dust/const/status_level.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';
import 'package:flutter_fine_dust/provider/region_provider.dart';
import 'package:flutter_fine_dust/provider/stat_provider.dart';
import 'package:flutter_fine_dust/provider/stat_state.dart';
import 'package:flutter_fine_dust/provider/theme_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isExpanded = true;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  scrollListener(){
    bool isExpanded = scrollController.offset < (MediaQuery.of(context).size.width + 56) - kToolbarHeight;
    if(isExpanded != this.isExpanded) {
      setState(() {
        this.isExpanded = isExpanded;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    if(context.watch<StatProvider>().state.status == StatStatus.loading){
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: context.watch<ThemeProvider>().state.primaryColor,
      drawer: Drawer(
        backgroundColor: context.watch<ThemeProvider>().state.primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('지역선택'),
            ),
            ...Region.values.map(
              (e) => ListTile(
                title: Text(e.kor),
                tileColor: Colors.white,
                selectedColor: Colors.black,
                selectedTileColor: context.watch<ThemeProvider>().state.subColor,
                selected: context.watch<RegionProvider>().state.region == e,
                onTap: () {
                  context.read<RegionProvider>().changeRegion(region: e);
                  Navigator.of(context).pop();
                },
              ),
            ).toList(),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<StatProvider>().fetch();
        },
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            MainAppBar(
              isExpanded: isExpanded,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  MainCard(
                    backgroundColor: context.watch<ThemeProvider>().state.subColor,
                    child: const NowStatCard(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ...ItemCode.values.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MainCard(
                        backgroundColor: context.watch<ThemeProvider>().state.subColor,
                        child: HourlyStatCard(itemCode: e),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
