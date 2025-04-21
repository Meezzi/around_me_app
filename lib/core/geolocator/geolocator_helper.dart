import 'package:geolocator/geolocator.dart';

/// 위치 권한 확인, 현재 위치 불러오기
class GeolocatorHelper {
  static Future<Position> getPosition() async {
    var permission = await Geolocator.checkPermission();

    // 현재 권한이 허용되지 않았을 때 권한 요청하기
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();

      // 권한 요청 후 결과가 거부일 때 리턴하기
      if (permission == LocationPermission.denied) {
        return Future.error('위치 권한을 허용해주세요 :)');
      }
    }
  }
}
