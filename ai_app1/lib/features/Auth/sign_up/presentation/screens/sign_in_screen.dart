import 'package:ai_app1/features/Auth/sign_up/presentation/controller/providers/sign_in_user_data_provider.dart';
import 'package:ai_app1/features/Auth/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/sign_up_entity.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static String signInScreenId = "SignInScreen";
  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    final userProvider = Provider.of<SignInUserDataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("Sign In"),
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
            // Image(
            //   image: AssetImage("assets/images/image.png"),
            //   width: 150,
            //   height: 150,
            // ),
            // Spacer(
            //   flex: 1,
            // ),
            CustomTextFormField(
              prefixIcon: Icon(Icons.person),
              hintText: "Email",
              onChanged: (data) {
                email = data;
              },
            ),
            Spacer(
              flex: 1,
            ),
            CustomTextFormField(
              prefixIcon: Icon(Icons.lock),
              hintText: "Password",
              onChanged: (data) {
                password = data;
              },
              obscureText: true,
            ),
            Spacer(
              flex: 1,
            ),
            ElevatedButton(
              onPressed: () async {
                var result = await userProvider
                    .signIn(SignUpEntity(email: email, password: password));
                result.fold((failures) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(failures.failureMessage)),
                  );
                }, (userCredential) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login Succefully")),
                  );
                });
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(220, 50)),
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
      ),
    );
  }
}
