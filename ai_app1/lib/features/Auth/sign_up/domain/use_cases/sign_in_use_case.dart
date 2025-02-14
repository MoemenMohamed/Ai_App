import 'package:ai_app1/core/usecases/use_case.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:ai_app1/features/Auth/sign_up/domain/repository/sign_in_repo.dart';

class SignInUseCase extends UseCase<dynamic, SignUpEntity> {
  final BaseSignInRepo baseSignInRepo;
  SignInUseCase({required this.baseSignInRepo});

  @override
  Future execute(SignUpEntity param) async {
    return await baseSignInRepo.postUserSignInData(signUpEntity: param);
  }
}
