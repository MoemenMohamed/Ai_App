import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class BaseLocationRepository {
  Future<Either<String, Position>> getCurrentLocation();
}
