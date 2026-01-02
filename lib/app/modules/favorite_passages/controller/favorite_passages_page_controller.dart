import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/pagination_entity.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';
import 'package:pray_app/app/domain/params/passage_like_params.dart';
import 'package:pray_app/app/domain/usecases/get_liked_passages_usecase.dart';
import 'package:pray_app/app/domain/usecases/like_passage_usecase.dart';

class FavoritePassagesPageController extends ChangeNotifier {
  final GetLikedPassagesUsecase _getLikedPassagesUsecase;
  final LikePassageUsecase _likePassageUsecase;

  List<PassageEntity> passages = [];
  List<PassageEntity> filteredPassages = [];
  PaginationEntity? pagination;
  bool isLoading = false;
  bool isLoadingMore = false;
  String? errorMessage;
  int currentPage = 1;
  String searchQuery = '';
  Set<int> togglingPassageIds = {};

  FavoritePassagesPageController({
    required GetLikedPassagesUsecase getLikedPassagesUsecase,
    required LikePassageUsecase likePassageUsecase,
  }) : _getLikedPassagesUsecase = getLikedPassagesUsecase,
       _likePassageUsecase = likePassageUsecase;

  Future<void> loadPassages() async {
    if (isLoading) return;

    _setLoading(true);
    _setError(null);
    currentPage = 1;
    passages.clear();

    final result = await _getLikedPassagesUsecase(currentPage);

    result.get((failure) => _setError(failure.message), (response) {
      if (response.success) {
        passages = response.data.passages;
        filteredPassages = passages;
        pagination = response.data.pagination;
      } else {
        _setError(response.message);
      }
    });

    _setLoading(false);
  }

  void searchPassages(String query) {
    searchQuery = query.toLowerCase();

    if (searchQuery.isEmpty) {
      filteredPassages = passages;
    } else {
      filteredPassages = passages.where((passage) {
        return passage.verseReference.toLowerCase().contains(searchQuery) ||
            passage.verseText.toLowerCase().contains(searchQuery) ||
            passage.description.toLowerCase().contains(searchQuery);
      }).toList();
    }

    notifyListeners();
  }

  Future<void> loadMore() async {
    if (isLoadingMore || pagination == null || !pagination!.hasNextPage) {
      return;
    }

    _setLoadingMore(true);
    currentPage++;

    final result = await _getLikedPassagesUsecase(currentPage);

    result.get(
      (failure) {
        currentPage--;
        _setError(failure.message);
      },
      (response) {
        if (response.success) {
          passages.addAll(response.data.passages);
          pagination = response.data.pagination;
          if (searchQuery.isEmpty) {
            filteredPassages = passages;
          }
        }
      },
    );

    _setLoadingMore(false);
  }

  Future<void> toggleLike(int passageId) async {
    if (togglingPassageIds.contains(passageId)) return;

    togglingPassageIds.add(passageId);
    notifyListeners();

    final params = PassageLikeParams(passageId: passageId);
    final result = await _likePassageUsecase(params);

    result.get((failure) => _setError(failure.message), (response) {
      if (response.success && !response.data.liked) {
        passages.removeWhere((p) => p.id == passageId);
        filteredPassages.removeWhere((p) => p.id == passageId);
      }
    });

    togglingPassageIds.remove(passageId);
    notifyListeners();
  }

  bool isTogglingLike(int passageId) {
    return togglingPassageIds.contains(passageId);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setLoadingMore(bool value) {
    isLoadingMore = value;
    notifyListeners();
  }

  void _setError(String? value) {
    errorMessage = value;
    notifyListeners();
  }

  void clearError() {
    _setError(null);
  }
}
