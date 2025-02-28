import 'package:ai_app1/features/Weather/data/models/weather_model/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherRemoteDatasource {
  Future<WeatherModel> getWeatherFromApi({required lat, required long}) async {
    Response response = await Dio().get(
        "https://api.weatherapi.com/v1/forecast.json?key=155510501e574b62ac7162445243011&q=$lat,$long&days=3");
    
    
    WeatherModel weather = WeatherModel.fromJson(response.data);
    return weather;
  }
}
