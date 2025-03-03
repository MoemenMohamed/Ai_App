import 'package:geolocator/geolocator.dart';
import 'package:either_dart/either.dart';

class LocationDataSource {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Either<String, Position>> determinePosition() async {

    LocationPermission permission;

    permission = await Geolocator.requestPermission();
    if (permission.name == 'always' || permission.name == 'whileInUse') {
      return Right(await Geolocator.getCurrentPosition());
    } else {
      return Left('Location permissions are denied');
    }
  }
}
