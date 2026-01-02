import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/entities/message_response_entity.dart';
import 'package:pray_app/app/domain/entities/user_metrics_response_entity.dart';
import 'package:pray_app/app/domain/entities/user_response_entity.dart';
import 'package:pray_app/app/domain/params/email_update_params.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/params/password_update_params.dart';
import 'package:pray_app/app/domain/params/profile_update_params.dart';
import 'package:pray_app/app/domain/params/register_params.dart';
import 'package:pray_app/app/domain/params/user_delete_params.dart';

abstract class UserRepository {
  Future<EitherOf<Failure, UserResponseEntity>> getUser();

  Future<EitherOf<Failure, UserMetricsResponseEntity>> getUserMetrics({
    required String userId,
  });

  Future<EitherOf<Failure, MessageResponseEntity>> registerUser({
    required RegisterParams params,
  });

  Future<EitherOf<Failure, LoginResponseEntity>> loginUser({
    required LoginParams params,
  });

  Future<EitherOf<Failure, UserResponseEntity>> updateUserProfile({
    required ProfileUpdateParams params,
  });

  Future<EitherOf<Failure, UserResponseEntity>> updateUserEmail({
    required EmailUpdateParams params,
  });

  Future<EitherOf<Failure, MessageResponseEntity>> updateUserPassword({
    required PasswordUpdateParams params,
  });

  Future<EitherOf<Failure, MessageResponseEntity>> deleteUser({
    required UserDeleteParams params,
  });
}
