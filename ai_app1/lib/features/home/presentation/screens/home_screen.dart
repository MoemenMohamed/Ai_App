import 'package:ai_app1/features/Auth/sign_up/presentation/screens/sign_in_screen.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String homeScreenId = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.signUpScreenId);
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(250, 60)),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.signInScreenId);
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(250, 60)),
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
