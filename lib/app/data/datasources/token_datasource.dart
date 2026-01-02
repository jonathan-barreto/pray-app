import 'package:pray_app/app/core/consts/app_secure_keys.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/secure_storage/secure_storage.dart';
import 'package:pray_app/app/data/models/token_model.dart';

abstract class TokenDataSource {
  Future<void> saveToken({required TokenModel token});

  Future<TokenModel?> getToken();

  Future<void> deleteToken();
}

class TokenDataSourceImpl implements TokenDataSource {
  final SecureStorage _secureStorage;

  TokenDataSourceImpl({required SecureStorage secureStorage})
    : _secureStorage = secureStorage;

  @override
  Future<void> saveToken({required TokenModel token}) async {
    try {
      await _secureStorage.write(
        key: AppSecureKeys.authToken,
        value: token.toJson(),
      );
    } catch (error) {
      throw SecureStorageException(
        message: 'Failed to save authentication token',
        error: error,
      );
    }
  }

  @override
  Future<TokenModel?> getToken() async {
    try {
      final String? storedValue = await _secureStorage.read(
        key: AppSecureKeys.authToken,
      );

      if (storedValue == null || storedValue.isEmpty) {
        return null;
      }

      return TokenModel.fromJson(storedValue);
    } catch (error) {
      throw SecureStorageException(
        message: 'Failed to read authentication token',
        error: error,
      );
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await _secureStorage.delete(key: AppSecureKeys.authToken);
    } catch (error) {
      throw SecureStorageException(
        message: 'Failed to delete authentication token',
        error: error,
      );
    }
  }
}
