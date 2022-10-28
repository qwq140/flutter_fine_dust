import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/component/main_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: List.generate(100, (index) => Text('$index')),
            ),
          )
        ],
      ),
    );
  }
}
