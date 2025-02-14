import 'package:ai_app1/features/Auth/sign_up/data/repository/sign_in_repository.dart';
import 'package:ai_app1/features/Auth/sign_up/data/repository/sign_up_repository.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/use_cases/sign_in_use_case.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/controller/providers/sign_in_user_data_provider.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/screens/sign_in_screen.dart';
import 'package:ai_app1/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import the generated file
import 'features/Auth/sign_up/presentation/controller/providers/sign_up_user_data_provider.dart';
import 'features/Auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'firebase_options.dart';

void main() async {
  final baseSignUpRepo = SignUpRepository();
  final signUpUseCase = SignUpUseCase(baseSignUpRepo: baseSignUpRepo);
  final baseSignInRepo = SignInRepository();
  final signInUseCase = SignInUseCase(baseSignInRepo: baseSignInRepo);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SignUpUserDataProvider(signUpUseCase: signUpUseCase),
    ),
    ChangeNotifierProvider(
      create: (context) => SignInUserDataProvider(signInUseCase: signInUseCase),
    ),
  ], child: const MainApp()));
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
      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.homeScreenId,
    );
  }
}
