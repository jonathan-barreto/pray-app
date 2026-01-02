import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';
import 'package:pray_app/app/domain/params/passage_like_params.dart';
import 'package:pray_app/app/domain/usecases/like_passage_usecase.dart';

class PassagePageController extends ChangeNotifier {
  final LikePassageUsecase _likePassageUsecase;

  PassagePageController({required LikePassageUsecase likePassageUsecase})
    : _likePassageUsecase = likePassageUsecase;

  final PageController pageController = PageController();

  int currentPage = 0;
  bool isLoading = false;
  bool isLiking = false;
  String? errorMessage;
  bool isLiked = false;

  void setIsLiked(bool value) {
    isLiked = value;
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

  Future<void> toggleLike(PassageEntity passage) async {
    if (isLiking) return;

    _setIsLiking(true);
    errorMessage = null;

    final params = PassageLikeParams(passageId: passage.id);
    final result = await _likePassageUsecase(params);

    result.get(
      (failure) {
        errorMessage = failure.message ?? 'Erro ao curtir passagem';
        _setIsLiking(false);
      },
      (response) {
        isLiked = response.data.liked;
        _setIsLiking(false);
      },
    );
  }

  void _setIsLiking(bool value) {
    isLiking = value;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
