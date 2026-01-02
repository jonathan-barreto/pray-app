import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/user_response_entity.dart';
import 'package:pray_app/app/domain/params/email_update_params.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class UpdateEmailUsecase
    implements Usecase<UserResponseEntity, EmailUpdateParams> {
  final UserRepository _repository;

  UpdateEmailUsecase({required UserRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, UserResponseEntity>> call(
    EmailUpdateParams params,
  ) async {
    return await _repository.updateUserEmail(params: params);
  }
}
