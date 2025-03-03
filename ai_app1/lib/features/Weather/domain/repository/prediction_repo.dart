abstract class BasePredictionRepo {
  Future<List<dynamic>> getPrediction(List<int> features);
}
