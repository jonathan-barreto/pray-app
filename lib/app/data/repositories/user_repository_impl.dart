import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/data/datasources/user_datasource.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/entities/message_response_entity.dart';
import 'package:pray_app/app/domain/entities/user_metrics_response_entity.dart';
import 'package:pray_app/app/domain/entities/user_response_entity.dart';
import 'package:pray_app/app/domain/mappers/login_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/message_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/user_metrics_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/user_response_mapper.dart';
import 'package:pray_app/app/domain/params/email_update_params.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/params/password_update_params.dart';
import 'package:pray_app/app/domain/params/profile_update_params.dart';
import 'package:pray_app/app/domain/params/register_params.dart';
import 'package:pray_app/app/domain/params/user_delete_params.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _remoteDataSource;

  UserRepositoryImpl({required UserDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<EitherOf<Failure, UserResponseEntity>> getUser() async {
    try {
      final userResponse = await _remoteDataSource.getUser();
      final userEntity = UserResponseMapper.fromModel(userResponse);
      return Resolve(userEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, UserMetricsResponseEntity>> getUserMetrics({
    required String userId,
  }) async {
    try {
      final metricsResponse = await _remoteDataSource.getUserMetrics(
        userId: userId,
      );
      final metricsEntity = UserMetricsResponseMapper.fromModel(
        metricsResponse,
      );
      return Resolve(metricsEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, MessageResponseEntity>> registerUser({
    required RegisterParams params,
  }) async {
    try {
      final registerResponse = await _remoteDataSource.registerUser(
        params: params,
      );
      final registerEntity = MessageResponseMapper.fromModel(registerResponse);
      return Resolve(registerEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, LoginResponseEntity>> loginUser({
    required LoginParams params,
  }) async {
    try {
      final loginResponse = await _remoteDataSource.loginUser(params: params);
      final loginEntity = LoginResponseMapper.fromModel(loginResponse);
      return Resolve(loginEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, UserResponseEntity>> updateUserProfile({
    required ProfileUpdateParams params,
  }) async {
    try {
      final updateResponse = await _remoteDataSource.updateUserProfile(
        params: params,
      );
      final updateEntity = UserResponseMapper.fromModel(updateResponse);
      return Resolve(updateEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, UserResponseEntity>> updateUserEmail({
    required EmailUpdateParams params,
  }) async {
    try {
      final updateResponse = await _remoteDataSource.updateUserEmail(
        params: params,
      );
      final updateEntity = UserResponseMapper.fromModel(updateResponse);
      return Resolve(updateEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, MessageResponseEntity>> updateUserPassword({
    required PasswordUpdateParams params,
  }) async {
    try {
      final updateResponse = await _remoteDataSource.updateUserPassword(
        params: params,
      );
      final updateEntity = MessageResponseMapper.fromModel(updateResponse);
      return Resolve(updateEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, MessageResponseEntity>> deleteUser({
    required UserDeleteParams params,
  }) async {
    try {
      final deleteResponse = await _remoteDataSource.deleteUser(params: params);
      final deleteEntity = MessageResponseMapper.fromModel(deleteResponse);
      return Resolve(deleteEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }
}
