import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/data/datasources/token_datasource.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';
import 'package:pray_app/app/domain/mappers/token_mapper.dart';
import 'package:pray_app/app/domain/repositories/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository {
  final TokenDataSource _localDataSource;

  TokenRepositoryImpl({required TokenDataSource localDataSource})
    : _localDataSource = localDataSource;

  @override
  Future<EitherOf<Failure, VoidSuccess>> saveToken({
    required TokenEntity token,
  }) async {
    try {
      await _localDataSource.saveToken(token: TokenMapper.fromEntity(token));

      return Resolve(voidSuccess);
    } on SecureStorageException catch (error) {
      return Reject(Failure.fromSecureStorageException(error));
    } catch (error) {
      return Reject(
        Failure(typeError: FailureType.generic, message: error.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, TokenEntity?>> getToken() async {
    try {
      final tokenModel = await _localDataSource.getToken();

      if (tokenModel == null) {
        return Resolve(null);
      }

      return Resolve(TokenMapper.fromModel(tokenModel));
    } on SecureStorageException catch (error) {
      return Reject(Failure.fromSecureStorageException(error));
    } catch (error) {
      return Reject(
        Failure(typeError: FailureType.generic, message: error.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, VoidSuccess>> deleteToken() async {
    try {
      await _localDataSource.deleteToken();

      return Resolve(voidSuccess);
    } on SecureStorageException catch (error) {
      return Reject(Failure.fromSecureStorageException(error));
    } catch (error) {
      return Reject(
        Failure(typeError: FailureType.generic, message: error.toString()),
      );
    }
  }
}
