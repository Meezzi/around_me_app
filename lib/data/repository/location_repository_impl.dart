import 'package:around_me_app/data/model/place.dart';
import 'package:around_me_app/data/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationRepositoryImpl implements Repository {
  final dio = Dio();
  @override
  Future<List<Place>> searchPlace(String query) async {
    final response = await dio.get(
      'https://openapi.naver.com/v1/search/local.json',
      queryParameters: {'query': query, 'displasy': 5},
      options: Options(
        headers: {
          'X-Naver-Client-Id': dotenv.env['NAVER_CLIENT_ID'],
          'X-Naver-Client-Secret': dotenv.env['NAVER_CLIENT_SECRET'],
        },
      ),
    );

    if (response.statusCode == 200) {
      final items = response.data['items'] as List;

      return items.map((item) {
        return Place(
          title: item['title'],
          category: item['category'],
          roadAddress: item['roadAddress'],
        );
      }).toList();
    }

    return [];
  }
}
