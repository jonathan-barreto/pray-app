import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/domain/params/complete_devotional_params.dart';
import 'package:pray_app/app/domain/params/submit_devotional_feedback_params.dart';
import 'package:pray_app/app/domain/usecases/complete_devotional_usecase.dart';
import 'package:pray_app/app/domain/usecases/submit_private_devotional_feedback_usecase.dart';
import 'package:pray_app/app/domain/usecases/submit_public_devotional_feedback_usecase.dart';

class DevotionalPageController extends ChangeNotifier {
  final SubmitPublicDevotionalFeedbackUsecase _submitPublicFeedbackUsecase;
  final SubmitPrivateDevotionalFeedbackUsecase _submitPrivateFeedbackUsecase;
  final CompleteDevotionalUsecase _completeDevotionalUsecase;

  DevotionalPageController({
    required SubmitPublicDevotionalFeedbackUsecase submitPublicFeedbackUsecase,
    required SubmitPrivateDevotionalFeedbackUsecase
    submitPrivateFeedbackUsecase,
    required CompleteDevotionalUsecase completeDevotionalUsecase,
  }) : _submitPublicFeedbackUsecase = submitPublicFeedbackUsecase,
       _submitPrivateFeedbackUsecase = submitPrivateFeedbackUsecase,
       _completeDevotionalUsecase = completeDevotionalUsecase;

  final TextEditingController feedbackController = TextEditingController();
  final PageController pageController = PageController();

  int currentPage = 0;
  int rating = 0;
  bool isLoading = false;
  String? errorMessage;

  void setRating(int value) {
    rating = value;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  void changePage(int page) {
    if (currentPage != page) {
      currentPage = page;
      notifyListeners();
    }
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> submitPublicFeedback(DevotionalEntity devotional) async {
    if (rating == 0) {
      errorMessage = 'Por favor, selecione uma avaliação.';
      notifyListeners();
      return;
    }

    _setIsLoading(true);
    errorMessage = null;

    final param = SubmitDevotionalFeedbackParams(
      devotionalId: devotional.id,
      feedback: feedbackController.text.trim(),
      evaluationNote: rating,
    );

    final result = await _submitPublicFeedbackUsecase(param);

    result.get(
      (failure) {
        errorMessage = failure.message ?? 'Erro ao enviar feedback';
        _setIsLoading(false);
      },
      (response) {
        _setIsLoading(false);
      },
    );
  }

  Future<void> submitPrivateFeedback(DevotionalEntity devotional) async {
    if (rating == 0) {
      errorMessage = 'Por favor, selecione uma avaliação.';
      notifyListeners();
      return;
    }

    _setIsLoading(true);
    errorMessage = null;

    final param = SubmitDevotionalFeedbackParams(
      devotionalId: devotional.id,
      feedback: feedbackController.text.trim(),
      evaluationNote: rating,
    );

    final result = await _submitPrivateFeedbackUsecase(param);

    result.get(
      (failure) {
        errorMessage = failure.message ?? 'Erro ao enviar feedback';
        _setIsLoading(false);
      },
      (response) {
        _setIsLoading(false);
      },
    );
  }

  /// Completa o devocional silenciosamente, sem feedback visual
  Future<void> completeDevotional(DevotionalEntity devotional) async {
    final type = devotional.userId != null && devotional.userId!.isNotEmpty
        ? 'private'
        : 'public';

    final param = CompleteDevotionalParams(
      devotionalId: devotional.id,
      type: type,
    );

    await _completeDevotionalUsecase(param);
    // Não tratamos erros ou sucessos aqui, pois é uma operação silenciosa
  }

  void _setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    feedbackController.dispose();
    super.dispose();
  }
}
