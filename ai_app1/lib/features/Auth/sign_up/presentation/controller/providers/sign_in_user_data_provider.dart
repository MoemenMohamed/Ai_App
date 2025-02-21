import 'package:ai_app1/core/errors/failures.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/use_cases/sign_in_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInUserDataProvider extends ChangeNotifier {
  final SignInUseCase signInUseCase;
  SignInUserDataProvider({required this.signInUseCase});
  Future<Either<Failures, UserCredential>> signIn(
      {required String email, required String password}) async {
    return await signInUseCase
        .execute(SignUpEntity(email: email, password: password));
  }
}
