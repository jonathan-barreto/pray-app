import 'package:flutter/material.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/calendar_day_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';
import 'package:pray_app/app/domain/entities/user_metrics_entity.dart';
import 'package:pray_app/app/domain/params/devotional_like_params.dart';
import 'package:pray_app/app/domain/params/get_user_metrics_params.dart';
import 'package:pray_app/app/domain/params/passage_like_params.dart';
import 'package:pray_app/app/domain/usecases/get_dashboard_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_user_metrics_usecase.dart';
import 'package:pray_app/app/domain/usecases/like_passage_usecase.dart';
import 'package:pray_app/app/domain/usecases/like_public_devotional_usecase.dart';

class TodayPageController extends ChangeNotifier {
  final GetDashboardUsecase _getDashboardUsecase;
  final LikePassageUsecase _likePassageUsecase;
  final LikePublicDevotionalUsecase _likePublicDevotionalUsecase;
  final GetUserMetricsUsecase _getUserMetricsUsecase;

  TodayPageController({
    required GetDashboardUsecase getDashboardUsecase,
    required LikePassageUsecase likePassageUsecase,
    required LikePublicDevotionalUsecase likePublicDevotionalUsecase,
    required GetUserMetricsUsecase getUserMetricsUsecase,
  }) : _getDashboardUsecase = getDashboardUsecase,
       _likePassageUsecase = likePassageUsecase,
       _likePublicDevotionalUsecase = likePublicDevotionalUsecase,
       _getUserMetricsUsecase = getUserMetricsUsecase;

  final ScrollController scrollController = ScrollController();

  bool isLoading = false;
  bool isLikingPassage = false;
  bool isLikingDevotional = false;
  String? errorMessage;

  DevotionalEntity? todayDevotional;
  PassageEntity? todayPassage;
  List<CalendarDayEntity> calendar = [];
  UserMetricsEntity? userMetrics;
  bool isLoadingMetrics = false;

  bool? passageLiked;
  bool? devotionalLiked;

  Future<void> loadDashboard() async {
    _setLoading(true);
    _setError(null);

    final result = await _getDashboardUsecase(NoParams());

    result.get((failure) => _setError(failure.message), (response) {
      if (response.success) {
        todayDevotional = response.data.publicDevotional;
        todayPassage = response.data.passage;
        calendar = response.data.calendar;
        initializeLikeStates(
          passage: todayPassage,
          devotional: todayDevotional,
        );
      } else {
        _setError(response.message);
      }
    });

    _setLoading(false);
  }

  String getGreeting() {
    final DateTime now = DateTime.now();

    if (now.hour < 12) {
      return 'Bom dia, ${AppController.instance.userProfile?.getFirstName()}!';
    } else if (now.hour < 18) {
      return 'Boa tarde, ${AppController.instance.userProfile?.getFirstName()}!';
    } else {
      return 'Boa noite, ${AppController.instance.userProfile?.getFirstName()}!';
    }
  }

  void initializeLikeStates({
    required PassageEntity? passage,
    required DevotionalEntity? devotional,
  }) {
    passageLiked = passage?.liked;
    devotionalLiked = devotional?.liked;
  }

  Future<void> togglePassageLike(PassageEntity passage) async {
    if (isLikingPassage) return;

    final bool currentLiked = passageLiked ?? (passage.liked);

    passageLiked = !currentLiked;
    notifyListeners();

    _setIsLikingPassage(true);
    errorMessage = null;

    final params = PassageLikeParams(passageId: passage.id);
    final result = await _likePassageUsecase(params);

    result.get(
      (failure) {
        passageLiked = currentLiked;
        errorMessage = failure.message ?? 'Erro ao curtir passagem';
        _setIsLikingPassage(false);
      },
      (response) {
        passageLiked = response.data.liked;
        _setIsLikingPassage(false);
      },
    );
  }

  Future<void> toggleDevotionalLike(DevotionalEntity devotional) async {
    if (isLikingDevotional) return;

    final bool currentLiked = devotionalLiked ?? (devotional.liked ?? false);

    devotionalLiked = !currentLiked;
    notifyListeners();

    _setIsLikingDevotional(true);
    errorMessage = null;

    final result = await _likePublicDevotionalUsecase(
      PublicDevotionalLikeParams(publicDevotionalId: devotional.id),
    );

    result.get(
      (failure) {
        devotionalLiked = currentLiked;
        errorMessage = failure.message ?? 'Erro ao curtir devocional';
        _setIsLikingDevotional(false);
      },
      (response) {
        devotionalLiked = response.data.liked;
        _setIsLikingDevotional(false);
      },
    );
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
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

  void _setIsLikingPassage(bool value) {
    if (isLikingPassage == value) return;
    isLikingPassage = value;
    notifyListeners();
  }

  void _setIsLikingDevotional(bool value) {
    if (isLikingDevotional == value) return;
    isLikingDevotional = value;
    notifyListeners();
  }

  Future<void> loadUserMetrics() async {
    final String? userId = AppController.instance.userProfile?.id;
    if (userId == null) return;

    _setLoadingMetrics(true);

    final result = await _getUserMetricsUsecase(
      GetUserMetricsParams(userId: userId),
    );

    result.get(
      (failure) {
        userMetrics = null;
        _setLoadingMetrics(false);
      },
      (response) {
        if (response.success) {
          userMetrics = response.data;
        } else {
          userMetrics = null;
        }
        _setLoadingMetrics(false);
      },
    );
  }

  void _setLoadingMetrics(bool value) {
    if (isLoadingMetrics == value) return;
    isLoadingMetrics = value;
    notifyListeners();
  }
}
