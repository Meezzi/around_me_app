import 'package:around_me_app/core/error/custom_exception.dart';
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

  /// 장소 검색 후, 응답 데이터 가져오기
  @override
  Future<Result<List<Place>>> searchPlace(String query) async {
    // try - catch 문은 인터넷 관련 예외 처리
    // Result 클래스는 실패를 throw로 던지지 않고 안전하게 처리
    try {
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
        List<Place> itemList = items.map((e) => Place.fromJson(e)).toList();

        return Result.ok(itemList);
      }

      return Result.error(
        CustomException(
          errorCode: response.statusCode!,
          errorMessage: response.statusMessage!,
        ),
      );
    } catch (exception) {
      return Result.error(
        CustomException(errorMessage: exception.toString(), errorCode: null),
      );
    }
  }
}
