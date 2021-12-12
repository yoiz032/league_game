import 'package:league_game/domain/services/location.dart';
import 'package:geolocator/geolocator.dart';

class GpsService implements LocationInterface {
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
}
