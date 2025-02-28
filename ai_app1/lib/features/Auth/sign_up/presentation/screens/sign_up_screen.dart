import 'package:ai_app1/core/widgets/custom_eleveated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/providers/sign_up_user_data_provider.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static String signUpScreenId = "SignUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<SignUpUserDataProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("Sign up"),
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
                  onChanged: (data) {},
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress),
              Spacer(
                flex: 1,
              ),
              CustomTextFormField(
                controller: passwordController,
                prefixIcon: Icon(Icons.lock),
                obscureText: !_isVisible,
                onChanged: (data) {},
                hintText: "password",
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: Icon(
                        _isVisible ? Icons.visibility : Icons.visibility_off)),
              ),
              Spacer(flex: 1),
              CustomeElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(220, 50)),
                onPressed: () async {
                  var result = await userProvider.signUp(
                      email: emailController.text,
                      password: passwordController.text);
                  result.fold((failures) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(failures.failureMessage)),
                    );
                  }, (userCredential) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Account Created Succefully")),
                    );
                  });
                },
                child: const Text(
                  "Sign Up",
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
