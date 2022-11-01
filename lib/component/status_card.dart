import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusCard extends StatelessWidget {

  // 맨위
  final String title;
  // 이모지 경로
  final String imgUrl;
  // 좋음, 보통, 나쁨, 매우나쁨
  final String level;
  // 농도 수치
  final String stat;
  final double? width;

  const StatusCard({Key? key, required this.title, required this.imgUrl, required this.level, required this.stat, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ts = TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white);

    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: ts,),
          const SizedBox(height: 8,),
          SvgPicture.asset(imgUrl, width: 24, color: Colors.white,),
          const SizedBox(height: 8,),
          Text(level, style: ts,),
          Text(stat, style: ts,),
        ],
      ),
    )
    ;
  }
}
