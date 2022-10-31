import 'package:flutter/material.dart';
import 'package:flutter_fine_dust/component/card_title.dart';
import 'package:flutter_fine_dust/component/status_card.dart';

class HourlyStatCard extends StatelessWidget {
  final String category;

  const HourlyStatCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTitle(title: '시간별 $category'),
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
                  children: List.generate(
                    24,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: index == 23 ? 0 : 10),
                      child: StatusCard(
                        title: '17시',
                        imgUrl: 'assets/img/best.svg',
                        level: '좋음',
                        stat: '29 ㎍/㎥',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
