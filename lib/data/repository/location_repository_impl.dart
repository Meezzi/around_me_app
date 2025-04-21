import 'package:around_me_app/core/result/result.dart';
import 'package:around_me_app/data/model/place.dart';
import 'package:around_me_app/data/repository/location_repository.dart';
import 'package:dio/dio.dart';

class LocationRepositoryImpl implements LocationRepository {
  final Dio dio;
  final String naverClientId;
  final String naverClientSecret;

  LocationRepositoryImpl({
    required this.dio,
    required this.naverClientId,
    required this.naverClientSecret,
  });

  @override
  Future<Result<List<Place>>> searchPlace(String query) async {
    final response = await dio.get(
      'https://openapi.naver.com/v1/search/local.json',
      queryParameters: {'query': query, 'display': 5},
      options: Options(
        headers: {
          'X-Naver-Client-Id': naverClientId,
          'X-Naver-Client-Secret': naverClientSecret,
        },
      ),
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> items = response.data['items'];
      List<Place> itemList =
          items.map((e) {
            return Place(
              title: e['title'],
              category: e['category'],
              roadAddress: e['roadAddress'],
            );
          }).toList();

      return Result.ok(itemList);
    }

    return [];
  }
}
