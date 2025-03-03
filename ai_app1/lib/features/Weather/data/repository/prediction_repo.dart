import 'dart:convert';

import 'package:ai_app1/features/Weather/domain/repository/prediction_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PredictionRepo implements BasePredictionRepo {
  @override
  Future<List<dynamic>> getPrediction(List<int> features) async {
    final url = Uri.parse('http://192.168.1.15:5001/predict');

    Map<String, dynamic> body = {'features': features};

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    print("momo ${response.statusCode}");
    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      print("momo ${prediction}");
      if (kDebugMode) {
        print('Prediction: $prediction');
        return prediction;
      }
      throw ("Error Occured");
    } else {
      if (kDebugMode) {
        print('Failed to get prediction');
      }
      throw ("Error Occured");
    }
  }
}
