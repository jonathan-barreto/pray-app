import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/password_reset_response_entity.dart';
import 'package:pray_app/app/domain/params/password_reset_confirm_params.dart';
import 'package:pray_app/app/domain/repositories/password_reset_repository.dart';

class PasswordResetConfirmUsecase
    implements
        Usecase<PasswordResetResponseEntity, PasswordResetConfirmParams> {
  final PasswordResetRepository _repository;

  PasswordResetConfirmUsecase({required PasswordResetRepository repository})
      : _repository = repository;

  @override
  Future<EitherOf<Failure, PasswordResetResponseEntity>> call(
    PasswordResetConfirmParams params,
  ) async {
    return await _repository.confirmReset(params: params);
  }
}
