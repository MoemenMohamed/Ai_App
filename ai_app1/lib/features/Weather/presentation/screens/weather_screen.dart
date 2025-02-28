import 'package:ai_app1/core/widgets/custom_eleveated_button.dart';
import 'package:ai_app1/features/Location/presentation/controllers/providers/location_provider.dart';
import 'package:ai_app1/features/Weather/presentation/controllers/providers/prediction_provider.dart';
import 'package:ai_app1/features/Weather/presentation/controllers/providers/weather_provider.dart';
import 'package:ai_app1/features/Weather/presentation/widgets/days_weather_forecasting.dart';
import 'package:ai_app1/features/Weather/presentation/widgets/today_weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  static String weatherScreenId = "WeatherScreen";

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchWeatherData();
    });
  }

  void _fetchWeatherData() async {
    final weather = Provider.of<WeatherDataProvider>(context, listen: false);
    final location = Provider.of<LocationProvider>(context, listen: false);

    final result = await location.fetchLocation();
    result.fold((error) {}, (position) async {
      await weather.getData(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double textScaleFactor = screenSize.width / 500;

    return Consumer<WeatherDataProvider>(builder: (context, weather, child) {
      if (weather.isLoading) {
        return Scaffold(body: const Center(child: CircularProgressIndicator()));
      }
      final weatherDetails = weather.weather;
      return Scaffold(
        appBar: AppBar(
          title: Text("My Weather"),
          backgroundColor: Colors.lightBlueAccent.shade100,
        ),
        body: Container(
          color: Colors.lightBlueAccent.shade100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
          child: Column(
            children: [
              TodayWeather(
                  screenSize: screenSize,
                  weatherDetails: weatherDetails!,
                  textScaleFactor: textScaleFactor),
              SizedBox(height: screenSize.height * 0.03),
              DaysweatherForeCast(
                  weatherDetails: weatherDetails, screenSize: screenSize),
              SizedBox(height: screenSize.height * 0.03),
              Consumer<PredictionProvider>(
                  builder: (context, prediction, child) {
                return Column(
                  children: [
                    CustomeElevatedButton(
                      onPressed: () async {
                        List<int> predValues = [0, 0, 0, 0, 0];
                        if (weatherDetails.weatherState == "rainy") {
                          predValues[0] = 1;
                        }
                        else if (weatherDetails.weatherState == "Sunny")
                        {
                          predValues[1] = 1;
                        }
                        if(weatherDetails.temp! > 35 && weatherDetails.temp! < 45)
                        {
                            predValues[2] = 1;
                        }
                        else
                        {
                          predValues[3] = 1;
                        }
                        await prediction.getPrediction(predValues);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        padding: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.015,
                            horizontal: screenSize.width * 0.2),
                      ),
                      child: Text(
                        "Predict",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18 * textScaleFactor),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Text(
                      prediction.predState.isEmpty
                          ? ""
                          : (prediction.predState == "1"
                              ? "You can go Outside"
                              : "It's preferable not to go now"),
                      style: TextStyle(
                        fontSize: 20 * textScaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              }),
              SizedBox(height: screenSize.height * 0.05),
            ],
          ),
        ),
      );
    });
  }
}
