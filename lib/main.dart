import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_fine_dust/pages/home_page.dart';
import 'package:flutter_fine_dust/provider/region_provider.dart';
import 'package:flutter_fine_dust/provider/region_stat_provider.dart';
import 'package:flutter_fine_dust/provider/stat_provider.dart';
import 'package:flutter_fine_dust/repository/stat_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StatProvider>(create: (context) => StatProvider(statRepository: StatRepository())..fetch(),),
        ChangeNotifierProvider<RegionProvider>(create: (context) => RegionProvider(),),
        ProxyProvider2<StatProvider, RegionProvider, RegionStatProvider>(
            update: (context, statProvider, regionProvider, previous) => RegionStatProvider(regionProvider: regionProvider, statProvider: statProvider),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}