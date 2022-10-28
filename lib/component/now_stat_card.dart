import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/component/card_title.dart';
import 'package:flutter_fine_dust/component/status_card.dart';

class NowStatCard extends StatelessWidget {
  const NowStatCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
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
                    children: List.generate(
                      6, (index) => StatusCard(
                        title: '미세먼지',
                        imgUrl: 'assets/img/best.svg',
                        level: '좋음',
                        stat: '29 ㎍/㎥',
                        width: constraint.maxWidth / 3,
                      ),
                    ),
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
