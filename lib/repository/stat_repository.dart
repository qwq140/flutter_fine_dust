import 'package:dio/dio.dart';
import 'package:flutter_fine_dust/const/item_code.dart';
import 'package:flutter_fine_dust/model/stat_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StatRepository {
  
  Future<List<StatModel>> fetchData({required ItemCode itemCode}) async {
    print(itemCode.kor);

    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey': dotenv.get('serviceKey'),
        'returnType': 'json',
        'numOfRows': 30,
        'pageNo': 1,
        'itemCode': itemCode.name,
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK',
      },
    );
    
    return response.data['response']['body']['items'].map<StatModel>((item) => StatModel.fromJson(json: item)).toList();
  }
}