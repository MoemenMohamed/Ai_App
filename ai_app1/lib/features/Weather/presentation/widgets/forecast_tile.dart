import 'package:flutter/material.dart';

class ForecastTile extends StatelessWidget {
  const ForecastTile(
      {super.key,
      required this.imageLink,
      required this.weatherState,
      required this.maxTemp,
      required this.minTemp,
      required this.forecastDate});
  final String imageLink;
  final String weatherState;
  final num maxTemp;
  final num minTemp;
  final String forecastDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: NetworkImage(imageLink)),
          Text(
            weatherState,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text("$maxTemp°/$minTemp°"),
          Text(forecastDate),
        ],
      ),
    );
  }
}
