import 'package:flutter/material.dart';

class StatusModel {
  // 단계
  final int level;

  // 단계 이름
  final String label;

  // 주 색상
  final Color primaryColor;

  // 부 색상
  final Color subColor;

  // 폰트 색상
  final Color fontColor;

  // 이모지 경로
  final String imgUrl;

  // 코멘트
  final String comment;

  // 미세먼지 최소치
  final double minFineDust;

  // 초미세먼지 최소치
  final double minUltraFineDust;

  // 오존 최소치
  final double minO3;

  // 이산화질소 최소치
  final double minNO2;

  // 일산화탄소 최소치
  final double minCO;

  // 아황산가스 최소치
  final double minSO2;

  StatusModel({
    required this.level,
    required this.label,
    required this.primaryColor,
    required this.subColor,
    required this.fontColor,
    required this.imgUrl,
    required this.comment,
    required this.minFineDust,
    required this.minUltraFineDust,
    required this.minO3,
    required this.minNO2,
    required this.minCO,
    required this.minSO2,
  });
}
