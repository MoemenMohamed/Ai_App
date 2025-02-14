import 'package:ai_app1/core/errors/failures.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpUserDataProvider extends ChangeNotifier {
  final SignUpUseCase signUpUseCase;
  SignUpUserDataProvider({required this.signUpUseCase});
  Future<Either<Failures, UserCredential>> signUp(
      SignUpEntity signUpEntity) async {
    return await signUpUseCase.execute(signUpEntity);
  }
}
