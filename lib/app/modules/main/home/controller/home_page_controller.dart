import 'package:flutter/material.dart';
import 'package:pray_app/app/core/consts/app_assets.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/calendar_day_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/domain/entities/home_tab_entity.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';
import 'package:pray_app/app/domain/usecases/get_dashboard_usecase.dart';
import 'package:pray_app/app/modules/main/community/page/community_page.dart';
import 'package:pray_app/app/modules/main/my_devotional/page/my_devotional_page.dart';
import 'package:pray_app/app/modules/main/settings/page/settings_page.dart';
import 'package:pray_app/app/modules/main/today/page/today_page.dart';

class HomePageController extends ChangeNotifier {
  final GetDashboardUsecase _getDashboardUsecase;

  HomePageController({required GetDashboardUsecase getDashboardUsecase})
    : _getDashboardUsecase = getDashboardUsecase;

  final List<Widget> pages = [
    const TodayPage(),
    const MyDevotionalPage(),
    const CommunityPage(),
    const SettingsPage(),
  ];

  final List<HomeTabEntity> tabs = [
    HomeTabEntity(assetPath: AppAssets.today, label: 'Hoje'),
    HomeTabEntity(assetPath: AppAssets.book, label: 'Meu Devocional'),
    HomeTabEntity(assetPath: AppAssets.community, label: 'Comunidade'),
    HomeTabEntity(assetPath: AppAssets.settings, label: 'Configurações'),
  ];

  bool isLoading = false;
  List<CalendarDayEntity> calendar = [];

  int currentIndex = 0;

  String? errorMessage;
  DevotionalEntity? todayDevotional;
  PassageEntity? todayPassage;

  Future<void> loadDashboard() async {
    _setLoading(true);
    _setError(null);

    final result = await _getDashboardUsecase(NoParams());

    result.get((failure) => _setError(failure.message), (response) {
      if (response.success) {
        todayDevotional = response.data.publicDevotional;
        todayPassage = response.data.passage;
        calendar = response.data.calendar;
      } else {
        _setError(response.message);
      }
    });

    _setLoading(false);
  }

  void onTabSelected(int index) {
    if (currentIndex == index) return;

    currentIndex = index;
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

  void clearError() {
    _setError(null);
  }
}
