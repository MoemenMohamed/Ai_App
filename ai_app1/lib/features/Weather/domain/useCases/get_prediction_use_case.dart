import 'package:ai_app1/core/usecases/use_case.dart';
import 'package:ai_app1/features/Weather/domain/repository/prediction_repo.dart';

class GetPredictionUseCase implements UseCase<List<dynamic>, List<int>, void> {
  final BasePredictionRepo basePredictionRepo;

  GetPredictionUseCase({required this.basePredictionRepo});

  @override
  Future<List<dynamic>> execute(param, {param2}) async{
    return await basePredictionRepo.getPrediction(param);
  }
}
