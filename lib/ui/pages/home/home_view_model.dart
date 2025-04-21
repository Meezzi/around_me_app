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
}
