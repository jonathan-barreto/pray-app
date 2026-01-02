import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/domain/params/generate_devotional_params.dart';
import 'package:pray_app/app/domain/usecases/generate_devotional_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_latest_private_devotional_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_private_devotional_by_id_usecase.dart';

class MyDevotionalPageController extends ChangeNotifier {
  final GenerateDevotionalUsecase _generateDevotionalUsecase;
  final GetPrivateDevotionalByIdUsecase _getPrivateDevotionalByIdUsecase;
  final GetLatestPrivateDevotionalUsecase _getLatestPrivateDevotionalUsecase;

  MyDevotionalPageController({
    required GenerateDevotionalUsecase generateDevotionalUsecase,
    required GetPrivateDevotionalByIdUsecase getPrivateDevotionalByIdUsecase,
    required GetLatestPrivateDevotionalUsecase
    getLatestPrivateDevotionalUsecase,
  }) : _generateDevotionalUsecase = generateDevotionalUsecase,
       _getPrivateDevotionalByIdUsecase = getPrivateDevotionalByIdUsecase,
       _getLatestPrivateDevotionalUsecase = getLatestPrivateDevotionalUsecase;

  final TextEditingController feelingController = TextEditingController();
  final int maxCharacters = 100;

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;
  DevotionalEntity? generatedDevotional;
  DevotionalEntity? lastDevotional;
  bool isLoadingLastDevotional = false;
  Timer? _pollingTimer;
  int? _devotionalId;

  bool canGenerateDevotionalToday() {
    if (lastDevotional == null) return true;

    final now = DateTime.now();
    final lastDevotionalDate = DateTime.parse(lastDevotional!.createdAt);

    return now.year != lastDevotionalDate.year ||
        now.month != lastDevotionalDate.month ||
        now.day != lastDevotionalDate.day;
  }

  Future<void> generateDevotional() async {
    if (feelingController.text.trim().isEmpty) {
      _setError('Por favor, descreva como você está se sentindo.');
      return;
    }

    _setLoading(true);
    _setError(null);
    _setSuccess(null);

    final params = GenerateDevotionalParams(
      feeling: feelingController.text.trim(),
    );

    final result = await _generateDevotionalUsecase(params);

    result.get(
      (failure) {
        _setError(failure.message);
        _setLoading(false);
      },
      (response) {
        if (response.success) {
          _devotionalId = response.data.id;
          _startPolling();
        } else {
          _setError(response.message);
          _setLoading(false);
        }
      },
    );
  }

  void _startPolling() {
    if (_devotionalId == null) return;

    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => _checkDevotionalStatus(),
    );

    _checkDevotionalStatus();
  }

  Future<void> _checkDevotionalStatus() async {
    if (_devotionalId == null) return;

    final result = await _getPrivateDevotionalByIdUsecase(_devotionalId!);

    result.get(
      (failure) {
        _stopPolling();
        _setError(failure.message);
        _setLoading(false);
      },
      (response) {
        if (response.success) {
          final DevotionalEntity devotional = response.data;

          if (devotional.title.isNotEmpty) {
            _stopPolling();
            generatedDevotional = devotional;
            lastDevotional = devotional;
            _setSuccess('Devocional gerado com sucesso!');
            feelingController.clear();
            _setLoading(false);
            _devotionalId = null;
          }
        }
      },
    );
  }

  void _stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  void clearGeneratedDevotional() {
    generatedDevotional = null;
    notifyListeners();
  }

  void cancelGeneration() {
    _stopPolling();
    _devotionalId = null;
    _setLoading(false);
    _setError(null);
  }

  void _setLoading(bool value) {
    if (isLoading == value) return;
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    if (errorMessage == value) return;
    errorMessage = value;
    notifyListeners();
  }

  void _setSuccess(String? value) {
    if (successMessage == value) return;
    successMessage = value;
    notifyListeners();
  }

  void clearError() {
    _setError(null);
  }

  void clearSuccess() {
    _setSuccess(null);
  }

  Future<void> loadLatestPrivateDevotional() async {
    _setLoadingLastDevotional(true);

    final result = await _getLatestPrivateDevotionalUsecase(NoParams());

    result.get(
      (failure) {
        lastDevotional = null;
        _setLoadingLastDevotional(false);
      },
      (response) {
        if (response.success) {
          lastDevotional = response.data;
        } else {
          lastDevotional = null;
        }
        _setLoadingLastDevotional(false);
      },
    );
  }

  void _setLoadingLastDevotional(bool value) {
    if (isLoadingLastDevotional == value) return;
    isLoadingLastDevotional = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _stopPolling();
    feelingController.dispose();
    super.dispose();
  }
}
