enum Region {
  chungnam('chungnam', '충남'),
  incheon('incheon', '인천'),
  daejeon('daejeon', '대전'),
  gyeongbuk('gyeongbuk', '경북'),
  sejong('sejong', '세종'),
  gwangju('gwangju', '광주'),
  jeonbuk('jeonbuk', '전북'),
  gangwon('gangwon', '강원'),
  ulsan('ulsan', '울산'),
  jeonnam('jeonnam', '전남'),
  seoul('seoul', '서울'),
  busan('busan', '부산'),
  jeju('jeju', '제주'),
  chungbuk('chungbuk', '충북'),
  gyeongnam('gyeongnam', '경남'),
  gyeonggi('gyeonggi', '경기'),
  daegu('daegu', '대구');

  final String eng;
  final String kor;

  const Region(this.eng, this.kor);
}