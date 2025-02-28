
class WeatherEntity {
  final String? weatherImage;
  final String? weatherState;
  final num? temp;
  final String? cityName;
  final String? countryName;
  final num? windSpeed;
  final String? lastUpdated;

  final String day1WeatherImage;
  final String day1WeatherState;
  final num day1TempMax;
  final num day1TempMin;
  final String day1Date;

  final String day2WeatherImage;
  final String day2WeatherState;
  final num day2TempMax;
  final num day2TempMin;
  final String day2Date;

  final String day3WeatherImage;
  final String day3WeatherState;
  final num day3TempMax;
  final num day3TempMin;
  final String day3Date;

  WeatherEntity({
    required this.weatherImage,
    required this.temp,
    required this.cityName,
    required this.countryName,
    required this.windSpeed,
    required this.lastUpdated,
    required this.weatherState,
    required this.day1WeatherImage,
    required this.day1WeatherState,
    required this.day1TempMax,
    required this.day1TempMin,
    required this.day1Date,

    required this.day2WeatherImage,
    required this.day2WeatherState,
    required this.day2TempMax,
    required this.day2TempMin,
    required this.day2Date,

    required this.day3WeatherImage,
    required this.day3WeatherState,
    required this.day3TempMax,
    required this.day3TempMin,
    required this.day3Date,

  });
}
