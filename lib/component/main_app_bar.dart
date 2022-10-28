import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/utils/data_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget {

  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ts = TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700);

    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.width + 56,
      backgroundColor: Colors.green,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight),
              Text('서울', style: ts),
              const SizedBox(height: 8,),
              Text(DataUtils.convertDateTimeToString(DateTime.now()), style: ts.copyWith(fontSize: 20, fontWeight: FontWeight.w300),),
              const SizedBox(height: 20,),
              SvgPicture.asset('assets/img/smile.svg', width: MediaQuery.of(context).size.width/3, color: Colors.white,),
              const SizedBox(height: 20,),
              Text('보통', style: ts,),
              const SizedBox(height: 8,),
              Text('그냥 무난한 날이에요', style: ts.copyWith(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
