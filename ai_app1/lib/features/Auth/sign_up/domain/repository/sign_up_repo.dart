import 'package:ai_app1/core/errors/failures.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseSignUpRepo {
  Future<Either<Failures, UserCredential>> postUserSignUpData(
      {required SignUpEntity signUpEntity});
}
