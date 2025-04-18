import 'package:around_me_app/data/model/place.dart';

abstract class Repository {
  Future<List<Place>> searchPlace(String query);
}
