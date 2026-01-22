import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/domain/entities/password_reset_response_entity.dart';
import 'package:pray_app/app/domain/params/password_reset_confirm_params.dart';
import 'package:pray_app/app/domain/params/password_reset_request_params.dart';

abstract class PasswordResetRepository {
  Future<EitherOf<Failure, PasswordResetResponseEntity>> requestReset({
    required PasswordResetRequestParams params,
  });

  Future<EitherOf<Failure, PasswordResetResponseEntity>> confirmReset({
    required PasswordResetConfirmParams params,
  });
}
