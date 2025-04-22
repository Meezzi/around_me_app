import 'package:around_me_app/core/geolocator/geolocator_helper.dart';
import 'package:around_me_app/core/result/result.dart';
import 'package:around_me_app/data/model/place.dart';
import 'package:around_me_app/data/repository/location_repository.dart';
import 'package:around_me_app/data/repository/location_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod/riverpod.dart';

class HomeViewModel extends Notifier<List<Place>> {
  LocationRepository locationRepository;

  HomeViewModel(this.locationRepository);

  @override
  List<Place> build() {
    return [];
  }

  /// 1. 지역 검색
  Future<List<Place>> searchPlace(String query) async {
    final result = await locationRepository.searchPlace(query);
    switch (result) {
      case Ok<List<Place>>():
        state = result.value;
        return state;

      case Error<List<Place>>():
        state = [];
        return [];
    }
  }

  // 2. 현재 위치로 주소 조회
  Future<void> searchByCurrentLocation() async {
    // 현재 위치
    final position = await GeolocatorHelper.getPosition();

    // 위도, 경도로 주소 불러오기
    final result = await locationRepository.findByLatLng(
      position.latitude,
      position.longitude,
    );

    // 응답 Result에 따른 분기 처리
    switch (result) {
      case Ok<List<String>>():
        List<Place> allPlaces = [];
        final addresses = result.value;

        for (final address in addresses) {
          final placeResult = await locationRepository.searchPlace(address);

          if (placeResult is Ok<List<Place>>) {
            allPlaces.addAll(placeResult.value);
          }
        }

        state = allPlaces;
        break;

      case Error<List<String>>():
        state = [];
        break;
    }
  }
}

/// HomeViewModel 관리자
final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Place>>(() {
  final locationRepository = LocationRepositoryImpl(
    dio: Dio(),
    naverClientId: dotenv.env['NAVER_CLIENT_ID']!,
    naverClientSecret: dotenv.env['NAVER_CLIENT_SECRET']!,
    vworldKey: dotenv.env['VWORLD_KEY']!,
  );

  return HomeViewModel(locationRepository);
});
