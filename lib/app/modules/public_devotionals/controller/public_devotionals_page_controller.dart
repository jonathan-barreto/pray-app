import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/domain/entities/pagination_entity.dart';
import 'package:pray_app/app/domain/usecases/get_liked_public_devotionals_usecase.dart';

class PublicDevotionalsPageController extends ChangeNotifier {
  final GetLikedPublicDevotionalsUsecase _getLikedPublicDevotionalsUsecase;

  PublicDevotionalsPageController({
    required GetLikedPublicDevotionalsUsecase getLikedPublicDevotionalsUsecase,
  }) : _getLikedPublicDevotionalsUsecase = getLikedPublicDevotionalsUsecase;

  List<DevotionalEntity> devotionals = [];
  List<DevotionalEntity> filteredDevotionals = [];
  PaginationEntity? pagination;
  bool isLoading = false;
  bool isLoadingMore = false;
  String? errorMessage;
  int currentPage = 1;
  String searchQuery = '';

  Future<void> loadDevotionals() async {
    if (isLoading) return;

    _setLoading(true);
    _setError(null);
    currentPage = 1;
    devotionals.clear();

    final result = await _getLikedPublicDevotionalsUsecase(currentPage);

    result.get((failure) => _setError(failure.message), (response) {
      if (response.success) {
        devotionals = response.data.devotionals;
        filteredDevotionals = devotionals;
        pagination = response.data.pagination;
      } else {
        _setError(response.message);
      }
    });

    _setLoading(false);
  }

  void searchDevotionals(String query) {
    searchQuery = query.toLowerCase();

    if (searchQuery.isEmpty) {
      filteredDevotionals = devotionals;
    } else {
      filteredDevotionals = devotionals.where((devotional) {
        return devotional.title.toLowerCase().contains(searchQuery) ||
            devotional.verseReference.toLowerCase().contains(searchQuery) ||
            devotional.description.toLowerCase().contains(searchQuery);
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

    final result = await _getLikedPublicDevotionalsUsecase(currentPage);

    result.get(
      (failure) {
        currentPage--;
        _setError(failure.message);
      },
      (response) {
        if (response.success) {
          devotionals.addAll(response.data.devotionals);
          pagination = response.data.pagination;
        }
      },
    );

    _setLoadingMore(false);
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
