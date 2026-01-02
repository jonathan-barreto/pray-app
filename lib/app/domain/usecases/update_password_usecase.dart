import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/message_response_entity.dart';
import 'package:pray_app/app/domain/params/password_update_params.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class UpdatePasswordUsecase
    implements Usecase<MessageResponseEntity, PasswordUpdateParams> {
  final UserRepository _repository;

  UpdatePasswordUsecase({required UserRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, MessageResponseEntity>> call(
    PasswordUpdateParams params,
  ) async {
    return await _repository.updateUserPassword(params: params);
  }
}
