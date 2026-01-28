import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/user_metrics_entity.dart';
import 'package:pray_app/app/domain/params/get_user_metrics_params.dart';
import 'package:pray_app/app/domain/usecases/get_user_metrics_usecase.dart';

class MetricsPageController extends ChangeNotifier {
  final GetUserMetricsUsecase _getUserMetricsUsecase;

  MetricsPageController({required GetUserMetricsUsecase getUserMetricsUsecase})
    : _getUserMetricsUsecase = getUserMetricsUsecase;

  bool isLoading = false;
  String? errorMessage;
  UserMetricsEntity? metrics;

  Future<void> loadMetrics({required String userId}) async {
    _setLoading(true);
    _setError(null);

    final GetUserMetricsParams params = GetUserMetricsParams(userId: userId);

    final result = await _getUserMetricsUsecase(params);

    result.get(
      (failure) => _setError(failure.message),
      (response) => _setMetrics(response.data),
    );

    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    errorMessage = value;
    notifyListeners();
  }

  void _setMetrics(UserMetricsEntity value) {
    metrics = value;
    notifyListeners();
  }

  void clearError() {
    _setError(null);
  }
}
