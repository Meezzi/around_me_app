import 'package:around_me_app/core/result/result.dart';
import 'package:around_me_app/data/model/place.dart';

abstract interface class LocationRepository {
  Future<Result<List<Place>>> searchPlace(String query);
}
