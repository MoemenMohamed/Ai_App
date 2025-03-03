import 'package:ai_app1/core/usecases/use_case.dart';
import 'package:ai_app1/features/Weather/domain/entities/weather_entity.dart';
import 'package:ai_app1/features/Weather/domain/repository/weather_repo.dart';

class GetWeatherInfoUseCase implements UseCase<WeatherEntity, double, double> {
  final BaseWeatherRepo baseWeatherRepo;

  GetWeatherInfoUseCase({required this.baseWeatherRepo});
  
  @override
  Future<WeatherEntity> execute(double param, {double? param2}) {
    return baseWeatherRepo.getWeatherData(lat: param, long: param2);
  }

  
}
