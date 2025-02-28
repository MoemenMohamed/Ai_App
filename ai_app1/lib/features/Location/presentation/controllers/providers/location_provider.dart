import 'package:ai_app1/features/Location/domain/use_case/get_location_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  final GetLocationUseCase getLocationUseCase;

  LocationProvider({required this.getLocationUseCase});

  Position? _position;
  bool _isLoading = false;
  String? _errorMessage;

  Position? get position => _position;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<Either<String, Position>> fetchLocation() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await getLocationUseCase.execute();
    return result.fold((error) {
      notifyListeners();
      _errorMessage = error;
      return Left(error);
    }, (position) {
      _isLoading = false;
      notifyListeners();
      return Right(position);
    });
  }
}
