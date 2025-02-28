class WeatherModel {
  final String? weatherImage;
  final String? weatherState;
  final num? temp;
  final String? cityName;
  final String? countryName;
  final num? windSpeed;
  final String? lastUpdated;

  final String day1forecastWeatherImage;
  final String day1forecastWeatherState;
  final num day1forecastTempMax;
  final num day1forecastTempMin;
  final String day1forecastDate;

  final String day2forecastWeatherImage;
  final String day2forecastWeatherState;
  final num day2forecastTempMax;
  final num day2forecastTempMin;
  final String day2forecastDate;

  final String day3forecastWeatherImage;
  final String day3forecastWeatherState;
  final num day3forecastTempMax;
  final num day3forecastTempMin;
  final String day3forecastDate;

  WeatherModel({
    required this.weatherImage,
    required this.weatherState,
    required this.temp,
    required this.cityName,
    required this.countryName,
    required this.windSpeed,
    required this.lastUpdated,
    required this.day1forecastWeatherImage,
    required this.day1forecastWeatherState,
    required this.day1forecastTempMax,
    required this.day1forecastTempMin,
    required this.day1forecastDate,
    required this.day2forecastWeatherImage,
    required this.day2forecastWeatherState,
    required this.day2forecastTempMax,
    required this.day2forecastTempMin,
    required this.day2forecastDate,
    required this.day3forecastWeatherImage,
    required this.day3forecastWeatherState,
    required this.day3forecastTempMax,
    required this.day3forecastTempMin,
    required this.day3forecastDate,
  });

  factory WeatherModel.fromJson(data) {
    return WeatherModel(
      weatherImage: data["current"]["condition"]["icon"],
      weatherState: data["current"]["condition"]["text"],
      temp: data["current"]['temp_c'],
      cityName: data['location']['name'],
      countryName: data['location']['country'],
      windSpeed: data["current"]['wind_kph'],
      lastUpdated: data["current"]['last_updated'],
      day1forecastWeatherImage: data["forecast"]["forecastday"][0]["day"]
          ["condition"]["icon"],
      day1forecastWeatherState: data["forecast"]["forecastday"][0]["day"]
          ["condition"]["text"],
      day1forecastTempMax: data["forecast"]["forecastday"][0]["day"]
          ["maxtemp_c"],
      day1forecastTempMin: data["forecast"]["forecastday"][0]["day"]
          ["mintemp_c"],
      day1forecastDate: data["forecast"]["forecastday"][0]["date"],
      day2forecastWeatherImage: data["forecast"]["forecastday"][1]["day"]
          ["condition"]["icon"],
      day2forecastWeatherState: data["forecast"]["forecastday"][1]["day"]
          ["condition"]["text"],
      day2forecastTempMax: data["forecast"]["forecastday"][1]["day"]
          ["maxtemp_c"],
      day2forecastTempMin: data["forecast"]["forecastday"][1]["day"]
          ["mintemp_c"],
      day2forecastDate: data["forecast"]["forecastday"][1]["date"],
      day3forecastWeatherImage: data["forecast"]["forecastday"][2]["day"]
          ["condition"]["icon"],
      day3forecastWeatherState: data["forecast"]["forecastday"][2]["day"]
          ["condition"]["text"],
      day3forecastTempMax: data["forecast"]["forecastday"][2]["day"]
          ["maxtemp_c"],
      day3forecastTempMin: data["forecast"]["forecastday"][2]["day"]
          ["mintemp_c"],
      day3forecastDate: data["forecast"]["forecastday"][2]["date"],
    );
  }
}
