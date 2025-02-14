import 'package:ai_app1/core/errors/failures.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/repository/sign_in_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepository extends BaseSignInRepo {
  @override
  Future<Either<Failures, UserCredential>> postUserSignInData(
      {required SignUpEntity signUpEntity}) async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: signUpEntity.email, password: signUpEntity.password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Left(Failures(
          failureMessage: e.message ?? "An unexpected Login error occurred."));
    } catch (e) {
      return Left(Failures(failureMessage: "An unexpected error occurred: $e"));
    }
  }
}
