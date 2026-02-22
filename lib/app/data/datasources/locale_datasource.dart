import 'package:pray_app/app/core/secure_storage/secure_storage.dart';

abstract class LocaleDataSource {
  Future<void> saveLocale({required String languageCode});
  Future<String?> getLocale();
  Future<void> deleteLocale();
}

class LocaleDataSourceImpl implements LocaleDataSource {
  final SecureStorage _secureStorage;

  LocaleDataSourceImpl({required SecureStorage secureStorage})
      : _secureStorage = secureStorage;

  static const String _localeKey = 'app_locale';

  @override
  Future<void> saveLocale({required String languageCode}) async {
    try {
      await _secureStorage.write(key: _localeKey, value: languageCode);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<String?> getLocale() async {
    try {
      return await _secureStorage.read(key: _localeKey);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> deleteLocale() async {
    try {
      await _secureStorage.delete(key: _localeKey);
    } catch (err) {
      rethrow;
    }
  }
}
