import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/data/datasources/password_reset_datasource.dart';
import 'package:pray_app/app/data/models/password_reset_response_model.dart';
import 'package:pray_app/app/domain/entities/password_reset_response_entity.dart';
import 'package:pray_app/app/domain/mappers/password_reset_response_mapper.dart';
import 'package:pray_app/app/domain/params/password_reset_confirm_params.dart';
import 'package:pray_app/app/domain/params/password_reset_request_params.dart';
import 'package:pray_app/app/domain/repositories/password_reset_repository.dart';

class PasswordResetRepositoryImpl implements PasswordResetRepository {
  final PasswordResetDataSource _remoteDataSource;

  PasswordResetRepositoryImpl({
    required PasswordResetDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<EitherOf<Failure, PasswordResetResponseEntity>> requestReset({
    required PasswordResetRequestParams params,
  }) async {
    try {
      final PasswordResetResponseModel responseModel =
          await _remoteDataSource.requestReset(params: params);

      final PasswordResetResponseEntity responseEntity =
          PasswordResetResponseMapper.fromModel(responseModel);

      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, PasswordResetResponseEntity>> confirmReset({
    required PasswordResetConfirmParams params,
  }) async {
    try {
      final PasswordResetResponseModel responseModel =
          await _remoteDataSource.confirmReset(params: params);

      final PasswordResetResponseEntity responseEntity =
          PasswordResetResponseMapper.fromModel(responseModel);

      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }
}
