import 'package:ai_app1/features/Weather/domain/useCases/get_prediction_use_case.dart';
import 'package:flutter/material.dart';

class PredictionProvider extends ChangeNotifier {
  final GetPredictionUseCase getPredictionUseCase;
  String _predState = ""; 

  String get predState => _predState;

  PredictionProvider({required this.getPredictionUseCase});

  Future<void> getPrediction(List<int> state) async {
    try {
      final result = await getPredictionUseCase.execute(state);
      _predState = result[0].toString();
    } catch (e) {
      _predState = "Failed to get prediction with error $e";
    }

    notifyListeners();
  }
}
