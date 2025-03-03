import 'package:ai_app1/core/usecases/no_param_use_case.dart';
import 'package:ai_app1/features/Location/domain/repository/get_location_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationUseCase extends NoParamUseCase {
  final BaseLocationRepository baseLocationRepository;
  GetLocationUseCase({required this.baseLocationRepository});

  @override
  Future<Either<String, Position>> execute() async{
    final result = await baseLocationRepository.getCurrentLocation();
    return result.fold(
        (error) => Left(error.toString()), (position) => Right(position));
  }
}
