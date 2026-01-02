import 'package:flutter/foundation.dart';
import 'package:pray_app/app/core/consts/app_texts.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';
import 'package:pray_app/app/domain/entities/user_entity.dart';

/// Main application controller
class AppController extends ChangeNotifier {
  static final AppController _instance = AppController._();

  /// Singleton instance of the AppController
  static AppController get instance => _instance;

  AppController._();

  /// App text constants
  final appTexts = AppTexts();

  /// User authentication token
  TokenEntity? _token;
  TokenEntity? get token => _token;

  /// User profile data
  UserEntity? _userProfile;
  UserEntity? get userProfile => _userProfile;

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

  /// Clear user tokens and profile (logout)
  void logout() {
    _token = null;
    _userProfile = null;
    notifyListeners();
    debugPrint('User logged out');
  }
}
