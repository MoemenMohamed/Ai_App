import 'package:ai_app1/core/errors/failures.dart';
import 'package:ai_app1/core/usecases/use_case.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/repository/sign_up_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUseCase extends UseCase<dynamic, SignUpEntity> {
  final BaseSignUpRepo baseSignUpRepo;
  SignUpUseCase({required this.baseSignUpRepo});

  @override
  Future<Either<Failures, UserCredential>> execute(SignUpEntity param) async {
    return await baseSignUpRepo.postUserSignUpData(signUpEntity: param);
  }
}
