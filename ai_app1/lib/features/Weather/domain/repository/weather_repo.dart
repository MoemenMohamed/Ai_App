import 'package:ai_app1/features/Weather/domain/entities/weather_entity.dart';

abstract class BaseWeatherRepo {
  Future<WeatherEntity> getWeatherData({required lat, required long});
}
