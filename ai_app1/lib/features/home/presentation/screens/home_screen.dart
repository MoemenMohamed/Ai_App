import 'package:ai_app1/core/widgets/custom_eleveated_button.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/screens/sign_in_screen.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String homeScreenId = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            CustomeElevatedButton(
              onPressed: () {
                onPageNavigatioButtonPressed(
                    context, SignUpScreen.signUpScreenId);
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(220, 50)),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            CustomeElevatedButton(
              onPressed: () {
                onPageNavigatioButtonPressed(
                    context, SignInScreen.signInScreenId);
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(220, 50)),
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void onPageNavigatioButtonPressed(context, screenId) {
  Navigator.pushNamed(context, screenId);
}
