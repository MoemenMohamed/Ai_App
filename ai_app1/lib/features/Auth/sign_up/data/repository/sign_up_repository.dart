import 'package:ai_app1/core/errors/failures.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/repository/sign_up_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepository extends BaseSignUpRepo {
  @override
  Future<Either<Failures, UserCredential>> postUserSignUpData(
      {required SignUpEntity signUpEntity}) async {
    try {
      final UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEntity.email,
        password: signUpEntity.password,
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(
            Failures(failureMessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        return Left(Failures(
            failureMessage: "The account already exists for that email."));
      }
      return Left(Failures(
          failureMessage:
              e.message ?? "An unexpected authentication error occurred."));
    } catch (e) {
      return Left(Failures(failureMessage: "An unexpected error occurred: $e"));
    }
  }
}
