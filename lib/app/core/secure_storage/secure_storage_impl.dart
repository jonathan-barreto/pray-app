import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pray_app/app/core/secure_storage/secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  SecureStorageImpl({required FlutterSecureStorage storage})
    : _storage = storage;

  final FlutterSecureStorage _storage;

  AndroidOptions get _androidOptions => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions get _iosOptions => const IOSOptions();

  MacOsOptions get _macOptions => const MacOsOptions();

  LinuxOptions get _linuxOptions => const LinuxOptions();

  WindowsOptions get _windowsOptions => const WindowsOptions();

  WebOptions get _webOptions => const WebOptions();

  @override
  Future<void> write({required String key, required String value}) {
    return _storage.write(
      key: key,
      value: value,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
      mOptions: _macOptions,
      lOptions: _linuxOptions,
      wOptions: _windowsOptions,
      webOptions: _webOptions,
    );
  }

  @override
  Future<String?> read({required String key}) {
    return _storage.read(
      key: key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
      mOptions: _macOptions,
      lOptions: _linuxOptions,
      wOptions: _windowsOptions,
      webOptions: _webOptions,
    );
  }

  @override
  Future<void> delete({required String key}) {
    return _storage.delete(
      key: key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
      mOptions: _macOptions,
      lOptions: _linuxOptions,
      wOptions: _windowsOptions,
      webOptions: _webOptions,
    );
  }

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll(
      aOptions: _androidOptions,
      iOptions: _iosOptions,
      mOptions: _macOptions,
      lOptions: _linuxOptions,
      wOptions: _windowsOptions,
      webOptions: _webOptions,
    );
  }
}
