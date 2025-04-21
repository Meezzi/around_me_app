import 'package:around_me_app/core/result/result.dart';
import 'package:around_me_app/data/model/place.dart';
import 'package:around_me_app/data/repository/location_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  test('searchPlace 호출 후, 응답을 파싱해서 Result.ok가 반환되는지 확인', () async {
    // given : 준비 단계 - 테스트를 위해 준비하는 과정
    // Dio를 상속받은 MockDio 객체를 생성 (HTTP 호출을 가짜로 처리)
    final mockDio = MockDio();

    // mockDio.get()이 호출되면 실제로 dummyData를 담은 응답을 반환하도록 설정
    // 실제 서버에 요청을 보내지 않고 테스트에 필요한 dummyData를 반환
    when(() {
      return mockDio.get(
        any(),
        queryParameters: any(named: 'queryParameters'),
        options: any(named: 'options'),
      );
    }).thenAnswer((invocation) async {
      return Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: dummyData,
      );
    });

    // 테스트 대상인 LocationRepositoryImpl 생성
    // Repository가 아닌 구현체 LocationRepositoryImpl을 생성하는 이유는 Impl의 동작을 검증하기 때문
    // mockDio를 주입하기 때문에 실제 네트워크 요청이 발생하지 않음
    final locationRepository = LocationRepositoryImpl(
      dio: mockDio,
      naverClientId: '',
      naverClientSecret: '',
    );

    // when : 실행 단계 - 실제로 테스트를 실행하는 과정
    // 테스트 대상 함수 실행
    // searchPlace()가 호출되면서 내부적으로 mockDio.get()을 호출하고 dummyData를 받게 됨
    final result = await locationRepository.searchPlace('카페');
  });
}

// mocktail 패키지를 활용하여 Dio를 mocking
// Dio를 흉내내는 가짜 객체 생성용 클래스
// Mock 클래스를 상속받아 Dio 타입처럼 동작할 것이라고 선언
class MockDio extends Mock implements Dio {}

// Naver Search API에서 받는다는 것을 가정한 가짜 응답 데이터
final dummyData = {
  "lastBuildDate": "Mon, 21 Apr 2025 10:59:09 +0900",
  "total": 1,
  "start": 1,
  "display": 1,
  "items": [
    {
      "title": "부일숯불갈비",
      "link": "",
      "category": "한식>육류,고기요리",
      "description": "",
      "telephone": "",
      "address": "서울특별시 영등포구 영등포동3가 23-11",
      "roadAddress": "서울특별시 영등포구 영중로6길 23-8",
      "mapx": "1269086523",
      "mapy": "375181466",
    },
  ],
};
