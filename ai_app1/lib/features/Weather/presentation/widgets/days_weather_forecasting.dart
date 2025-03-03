import 'package:ai_app1/features/Weather/domain/entities/weather_entity.dart';
import 'package:ai_app1/features/Weather/presentation/widgets/forecast_tile.dart';
import 'package:flutter/material.dart';

class DaysweatherForeCast extends StatelessWidget {
  const DaysweatherForeCast({
    super.key,
    required this.weatherDetails,
    required this.screenSize,
  });

  final WeatherEntity weatherDetails;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ForecastTile(
            imageLink: weatherDetails.day1WeatherImage,
            weatherState: weatherDetails.day1WeatherState,
            maxTemp: weatherDetails.day1TempMax,
            minTemp: weatherDetails.day1TempMin,
            forecastDate: weatherDetails.day1Date,
          ),
        ),
        SizedBox(width: screenSize.width * 0.02),
        Expanded(
          child: ForecastTile(
            imageLink: weatherDetails.day2WeatherImage,
            weatherState: weatherDetails.day2WeatherState,
            maxTemp: weatherDetails.day2TempMax,
            minTemp: weatherDetails.day2TempMin,
            forecastDate: weatherDetails.day2Date,
          ),
        ),
        SizedBox(width: screenSize.width * 0.02),
        Expanded(
          child: ForecastTile(
            imageLink: weatherDetails.day3WeatherImage,
            weatherState: weatherDetails.day3WeatherState,
            maxTemp: weatherDetails.day3TempMax,
            minTemp: weatherDetails.day3TempMin,
            forecastDate: weatherDetails.day3Date,
          ),
        ),
      ],
    );
  }
}