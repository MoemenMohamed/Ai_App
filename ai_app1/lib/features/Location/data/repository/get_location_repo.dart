import 'package:ai_app1/features/Location/data/data_source/location_data_source.dart';
import 'package:ai_app1/features/Location/domain/repository/get_location_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';

class LocationRepository implements BaseLocationRepository {
  final LocationDataSource datasource;

  LocationRepository({required this.datasource});
  @override
  Future<Either<String, Position>> getCurrentLocation() async {
    final result = await datasource.determinePosition();
    return result.fold(
        (error) => Left(error.toString()), (position) => Right(position));
  }
}
