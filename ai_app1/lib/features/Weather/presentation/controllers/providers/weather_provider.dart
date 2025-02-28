import 'package:ai_app1/features/Weather/domain/entities/weather_entity.dart';
import 'package:ai_app1/features/Weather/domain/useCases/get_weather_info_use_case.dart';
import 'package:flutter/material.dart';

class WeatherDataProvider extends ChangeNotifier {
  final GetWeatherInfoUseCase getWeatherInfoUseCase;

  bool isLoading = true;
  WeatherEntity? weather;

  WeatherDataProvider({required this.getWeatherInfoUseCase});

  Future<void> getData(latitude, longitude) async {
    try {
      weather = await getWeatherInfoUseCase.execute(
        latitude,
        param2: longitude,
      );
      isLoading = false;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
