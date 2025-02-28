import 'package:ai_app1/features/Weather/data/datasources/remote/weather_remote_datasource.dart';
import 'package:ai_app1/features/Weather/domain/entities/weather_entity.dart';
import 'package:ai_app1/features/Weather/domain/repository/weather_repo.dart';

class WeatherRepo implements BaseWeatherRepo {
  @override
  Future<WeatherEntity> getWeatherData({required lat, required long}) async {
    var modelData =
        await WeatherRemoteDatasource().getWeatherFromApi(lat: lat, long: long);
    return WeatherEntity(
      weatherImage: modelData.weatherImage ?? "", // ✅ Provide default value
      temp: modelData.temp ?? 0.0, // ✅ Ensure a valid number
      cityName: modelData.cityName,
      countryName: modelData.countryName ?? "Unknown",
      windSpeed: (modelData.windSpeed ?? 0.0).toDouble(), // ✅ Convert safely
      lastUpdated: modelData.lastUpdated ?? "No Data",
      weatherState: modelData.weatherState ?? "Unknown",
      day1WeatherImage: "https:${modelData.day1forecastWeatherImage}",
      day1WeatherState: modelData.day1forecastWeatherState,
      day1TempMax: modelData.day1forecastTempMax,
      day1TempMin: modelData.day1forecastTempMin,
      day1Date: modelData.day1forecastDate,

      day2WeatherImage: "https:${modelData.day2forecastWeatherImage}",
      day2WeatherState: modelData.day2forecastWeatherState,
      day2TempMax: modelData.day2forecastTempMax,
      day2TempMin: modelData.day2forecastTempMin,
      day2Date: modelData.day2forecastDate,

      day3WeatherImage: "https:${modelData.day3forecastWeatherImage}",
      day3WeatherState: modelData.day3forecastWeatherState,
      day3TempMax: modelData.day3forecastTempMax,
      day3TempMin: modelData.day3forecastTempMin,
      day3Date: modelData.day3forecastDate,
    );
  }
}
