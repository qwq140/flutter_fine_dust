enum ItemCode {
  PM10('PM10', '미세먼지'),
  PM25('PM2.5', '초미세먼지'),
  NO2('NO2', '이산화질소'),
  O3('O3', '오존'),
  CO('CO', '일산화탄소'),
  SO2('SO2', '아황산가스');

  final String eng;
  final String kor;

  const ItemCode(this.eng, this.kor);
}