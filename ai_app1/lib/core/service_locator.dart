import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import '../features/Auth/sign_up/data/repository/sign_in_repository.dart';
import '../features/Auth/sign_up/data/repository/sign_up_repository.dart';
import '../features/Auth/sign_up/domain/use_cases/sign_in_use_case.dart';
import '../features/Auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import '../features/Auth/sign_up/presentation/controller/providers/sign_in_user_data_provider.dart';
import '../features/Auth/sign_up/presentation/controller/providers/sign_up_user_data_provider.dart';
import '../features/Location/data/data_source/location_data_source.dart';
import '../features/Location/data/repository/get_location_repo.dart';
import '../features/Location/domain/use_case/get_location_use_case.dart';
import '../features/Location/presentation/controllers/providers/location_provider.dart';
import '../features/Weather/data/repository/prediction_repo.dart';
import '../features/Weather/data/repository/weather_repo.dart';
import '../features/Weather/domain/useCases/get_prediction_use_case.dart';
import '../features/Weather/domain/useCases/get_weather_info_use_case.dart';
import '../features/Weather/presentation/controllers/providers/prediction_provider.dart';
import '../features/Weather/presentation/controllers/providers/weather_provider.dart';

final sl = GetIt.instance; // Service locator instance

Future<void> setupServiceLocator() async {
  // Firebase
  await Firebase.initializeApp();

  // Repositories
  sl.registerLazySingleton<SignUpRepository>(() => SignUpRepository());
  sl.registerLazySingleton<SignInRepository>(() => SignInRepository());
  sl.registerLazySingleton<WeatherRepo>(() => WeatherRepo());
  sl.registerLazySingleton<LocationDataSource>(() => LocationDataSource());
  sl.registerLazySingleton<LocationRepository>(
      () => LocationRepository(datasource: sl<LocationDataSource>()));
  sl.registerLazySingleton<PredictionRepo>(() => PredictionRepo());

  // Use Cases
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(baseSignUpRepo: sl<SignUpRepository>()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(baseSignInRepo: sl<SignInRepository>()));
  sl.registerLazySingleton<GetWeatherInfoUseCase>(
      () => GetWeatherInfoUseCase(baseWeatherRepo: sl<WeatherRepo>()));
  sl.registerLazySingleton<GetLocationUseCase>(
      () => GetLocationUseCase(baseLocationRepository: sl<LocationRepository>()));
  sl.registerLazySingleton<GetPredictionUseCase>(
      () => GetPredictionUseCase(basePredictionRepo: sl<PredictionRepo>()));

  // Providers
  sl.registerFactory(() => SignUpUserDataProvider(signUpUseCase: sl<SignUpUseCase>()));
  sl.registerFactory(() => SignInUserDataProvider(signInUseCase: sl<SignInUseCase>()));
  sl.registerFactory(() => WeatherDataProvider(getWeatherInfoUseCase: sl<GetWeatherInfoUseCase>()));
  sl.registerFactory(() => LocationProvider(getLocationUseCase: sl<GetLocationUseCase>()));
  sl.registerFactory(() => PredictionProvider(getPredictionUseCase: sl<GetPredictionUseCase>()));
}
