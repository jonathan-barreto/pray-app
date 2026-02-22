import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:pray_app/app/core/consts/app_texts.dart';
import 'package:pray_app/app/data/datasources/locale_datasource.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';
import 'package:pray_app/app/domain/entities/user_entity.dart';

/// Main application controller
class AppController extends ChangeNotifier {
  static final AppController _instance = AppController._();

  /// Singleton instance of the AppController
  static AppController get instance => _instance;

  AppController._();

  LocaleDataSource? _localeDataSource;

  /// Initialize locale data source
  void initLocaleDataSource(LocaleDataSource localeDataSource) {
    _localeDataSource = localeDataSource;
  }

  /// App text constants
  final appTexts = AppTexts();

  /// User authentication token
  TokenEntity? _token;
  TokenEntity? get token => _token;

  /// User profile data
  UserEntity? _userProfile;
  UserEntity? get userProfile => _userProfile;

  /// Current app locale
  Locale? _locale;
  Locale? get locale => _locale;

  /// Set user tokens
  void setToken(TokenEntity token) {
    _token = token;
    notifyListeners();
  }

  /// Set user profile
  void setUserProfile(UserEntity profile) {
    _userProfile = profile;
    notifyListeners();
  }

  /// Set app locale and persist it
  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();

    if (_localeDataSource != null) {
      try {
        await _localeDataSource!.saveLocale(languageCode: locale.languageCode);
      } catch (e) {
        debugPrint('Error saving locale: $e');
      }
    }
  }

  /// Load saved locale from storage or set default based on device language
  Future<void> loadSavedLocale() async {
    if (_localeDataSource != null) {
      try {
        final savedLanguageCode = await _localeDataSource!.getLocale();
        if (savedLanguageCode != null) {
          _locale = Locale(savedLanguageCode);
          notifyListeners();
        }
      } catch (e) {
        debugPrint('Error loading locale: $e');
      }
    }
  }

  /// Set default locale based on device language
  void setDefaultLocaleFromDevice(Locale? deviceLocale) {
    if (_locale != null) return;

    if (deviceLocale != null) {
      final languageCode = deviceLocale.languageCode;
      if (languageCode == 'pt') {
        _locale = const Locale('pt');
      } else {
        _locale = const Locale('en');
      }
    } else {
      _locale = const Locale('pt');
    }
    notifyListeners();
  }

  /// Clear user tokens and profile (logout)
  void logout() {
    _token = null;
    _userProfile = null;
    notifyListeners();
    debugPrint('User logged out');
  }
}
