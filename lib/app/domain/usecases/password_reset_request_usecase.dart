import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/password_reset_response_entity.dart';
import 'package:pray_app/app/domain/params/password_reset_request_params.dart';
import 'package:pray_app/app/domain/repositories/password_reset_repository.dart';

class PasswordResetRequestUsecase
    implements
        Usecase<PasswordResetResponseEntity, PasswordResetRequestParams> {
  final PasswordResetRepository _repository;

  PasswordResetRequestUsecase({required PasswordResetRepository repository})
      : _repository = repository;

  @override
  Future<EitherOf<Failure, PasswordResetResponseEntity>> call(
    PasswordResetRequestParams params,
  ) async {
    return await _repository.requestReset(params: params);
  }
}
