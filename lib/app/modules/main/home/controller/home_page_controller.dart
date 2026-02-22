import 'package:flutter/material.dart';

import 'package:pray_app/app/app_controller.dart';
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
import 'package:pray_app/l10n/app_localizations.dart';

class HomePageController extends ChangeNotifier {
  final GetDashboardUsecase _getDashboardUsecase;

  HomePageController({required GetDashboardUsecase getDashboardUsecase})
      : _getDashboardUsecase = getDashboardUsecase {
    AppController.instance.addListener(_onLocaleChanged);
  }

  final List<Widget> pages = [
    const TodayPage(),
    const MyDevotionalPage(),
    const CommunityPage(),
    const SettingsPage(),
  ];

  List<HomeTabEntity> _tabs = [];
  List<HomeTabEntity> get tabs => _tabs;

  void _onLocaleChanged() {
    notifyListeners();
  }

  void initializeTabs(BuildContext context) {
    _tabs = [
      HomeTabEntity(
          assetPath: AppAssets.today,
          label: AppLocalizations.of(context)!.tabToday),
      HomeTabEntity(
          assetPath: AppAssets.book,
          label: AppLocalizations.of(context)!.tabMyDevotional),
      HomeTabEntity(
          assetPath: AppAssets.community,
          label: AppLocalizations.of(context)!.tabCommunity),
      HomeTabEntity(
          assetPath: AppAssets.settings,
          label: AppLocalizations.of(context)!.tabSettings),
    ];
  }

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

  @override
  void dispose() {
    AppController.instance.removeListener(_onLocaleChanged);
    super.dispose();
  }
}
