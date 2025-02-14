import 'package:ai_app1/features/Auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/providers/sign_up_user_data_provider.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static String signUpScreenId = "SignUpScreen";
  @override
  Widget build(BuildContext context) {
    String email = "";       
    String password = "";
    final userProvider = Provider.of<SignUpUserDataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("Sign up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Spacer(
              flex: 5,
            ),
            // ), Image(
            //   image: AssetImage("assets/images/add-user.png"),
            //   width: 150,
            //   height: 150,
            // ),
            // Spacer(
            //   flex: 1,
            // ),
            CustomTextFormField(
              prefixIcon: Icon(Icons.person),
              onChanged: (data) {
                email = data;
              },
              hintText: "Email",
            ),
            Spacer(
              flex: 1,
            ),
            CustomTextFormField(
              prefixIcon: Icon(Icons.lock),
              obscureText: true,
              onChanged: (data) {
                password = data;
              },
              hintText: "password",
            ),
            Spacer(flex: 1),
            ElevatedButton(
              onPressed: () async {
                var result = await userProvider
                    .signUp(SignUpEntity(email: email, password: password));
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
              style: ElevatedButton.styleFrom(fixedSize: Size(220, 50)),
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
      ),
    );
  }
}
