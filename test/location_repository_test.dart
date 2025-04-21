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
  });
}

// mocktail 패키지를 활용하여 Dio를 mocking
// Dio를 흉내내는 가짜 객체 생성용 클래스
// Mock 클래스를 상속받아 Dio 타입처럼 동작할 것이라고 선언
class MockDio extends Mock implements Dio {}
