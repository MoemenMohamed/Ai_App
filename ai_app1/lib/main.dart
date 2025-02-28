import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ai_app1/core/service_locator.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/screens/sign_in_screen.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:ai_app1/features/Weather/presentation/screens/weather_screen.dart';
import 'package:ai_app1/features/home/presentation/screens/home_screen.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/controller/providers/sign_up_user_data_provider.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/controller/providers/sign_in_user_data_provider.dart';
import 'package:ai_app1/features/Location/presentation/controllers/providers/location_provider.dart';
import 'package:ai_app1/features/Weather/presentation/controllers/providers/weather_provider.dart';
import 'package:ai_app1/features/Weather/presentation/controllers/providers/prediction_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator(); 

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => sl<SignUpUserDataProvider>()),
      ChangeNotifierProvider(create: (context) => sl<SignInUserDataProvider>()),
      ChangeNotifierProvider(create: (context) => sl<WeatherDataProvider>()),
      ChangeNotifierProvider(create: (context) => sl<LocationProvider>()),
      ChangeNotifierProvider(create: (context) => sl<PredictionProvider>()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.homeScreenId: (context) => HomeScreen(),
        SignUpScreen.signUpScreenId: (context) => SignUpScreen(),
        SignInScreen.signInScreenId: (context) => SignInScreen(),
        WeatherScreen.weatherScreenId: (context) => WeatherScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.homeScreenId,
    );
  }
}
