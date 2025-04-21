import 'package:around_me_app/core/result/result.dart';
import 'package:around_me_app/data/model/place.dart';
import 'package:around_me_app/data/repository/location_repository.dart';
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
}