import 'package:around_me_app/core/error/custom_exception.dart';
import 'package:around_me_app/core/result/result.dart';
import 'package:around_me_app/data/model/place.dart';
import 'package:around_me_app/data/repository/location_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationRepositoryImpl implements LocationRepository {
  final Dio dio;
  final String naverClientId;
  final String naverClientSecret;
  final String vworldKey;

  LocationRepositoryImpl({
    required this.dio,
    required this.naverClientId,
    required this.naverClientSecret,
    required this.vworldKey,
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
        final items = response.data['items'] as List<dynamic>;

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

  /// 위도, 경도로 주소 목록 가져오기
  @override
  Future<Result<List<String>>> findByLatLng(double lat, double lng) async {
    try {
      final response = await dio.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'data': 'LT_C_ADEMD_INFO',
          'key': vworldKey,
          'geomfilter': 'point($lng $lat)',
          'geometry': 'false',
        },
      );

      if (response.statusCode != 200) {
        return Result.error(
          CustomException(
            errorCode: response.statusCode,
            errorMessage: 'VWORLD 응답 코드 오류',
          ),
        );
      }

      if (response.data['response']['status'] != 'OK') {
        return Result.error(
          CustomException(
            errorCode: null,
            errorMessage:
                'VWORLD 응답 오류: ${response.data['response']['status']}',
          ),
        );
      }

      final features = List.of(
        response.data['response']['result']['featureCollection']['features'],
      );

      final addresses =
          features.map((e) => e['properties']['full_nm'].toString()).toList();

      return Result.ok(addresses);
    } catch (e) {
      return Result.error(
        CustomException(errorCode: null, errorMessage: '주소 조회 중 오류 발생: $e'),
      );
    }
  }
}
