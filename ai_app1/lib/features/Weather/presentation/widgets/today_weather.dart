
import 'package:ai_app1/features/Weather/domain/entities/weather_entity.dart';
import 'package:flutter/material.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({
    super.key,
    required this.screenSize,
    required this.weatherDetails,
    required this.textScaleFactor,
  });

  final Size screenSize;
  final WeatherEntity weatherDetails;
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenSize.height * 0.02),
        Image.network(
          "https:${weatherDetails.weatherImage}",
          width: screenSize.width * 0.3,
          fit: BoxFit.cover,
        ),
        Text(
          weatherDetails.weatherState!,
          style: TextStyle(fontSize: 20 * textScaleFactor),
        ),
        Text(
          "${weatherDetails.temp}°",
          style: TextStyle(fontSize: 55 * textScaleFactor),
        ),
        Text(
          weatherDetails.cityName!,
          style: TextStyle(fontSize: 30 * textScaleFactor),
        ),
        Text(
          weatherDetails.countryName!,
          style: TextStyle(fontSize: 25 * textScaleFactor),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wind Speed:  ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${weatherDetails.windSpeed} kph")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Last Updated:  ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(weatherDetails.lastUpdated!)
          ],
        ),
      ],
    );
  }
}
