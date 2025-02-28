import 'package:ai_app1/features/Auth/sign_up/presentation/controller/providers/sign_in_user_data_provider.dart';
import 'package:ai_app1/core/widgets/custom_eleveated_button.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:ai_app1/features/Weather/presentation/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String signInScreenId = "SignInScreen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<SignInUserDataProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("Sign In"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 5,
              ),
              CustomTextFormField(
                controller: emailController,
                prefixIcon: Icon(Icons.person),
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                onChanged: (data) {},
              ),
              Spacer(
                flex: 1,
              ),
              CustomTextFormField(
                controller: passwordController,
                prefixIcon: Icon(Icons.lock),
                hintText: "Password",
                onChanged: (data) {},
                obscureText: !_isVisible,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: Icon(
                        _isVisible ? Icons.visibility : Icons.visibility_off)),
              ),
              Spacer(
                flex: 1,
              ),
              CustomeElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(220, 50)),
                onPressed: () async {
                  var result = await userProvider.signIn(
                      email: emailController.text,
                      password: passwordController.text);
                  result.fold((failures) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(failures.failureMessage)),
                    );
                  }, (userCredential) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login Succefully")),
                    );
                    Navigator.pushReplacementNamed(
                        context, WeatherScreen.weatherScreenId);
                  });
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        );
      }),
    );
  }
}
