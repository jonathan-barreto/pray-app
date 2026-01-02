import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/message_response_entity.dart';
import 'package:pray_app/app/domain/params/register_params.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class RegisterUsecase
    implements Usecase<MessageResponseEntity, RegisterParams> {
  final UserRepository _repository;

  RegisterUsecase({required UserRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, MessageResponseEntity>> call(
    RegisterParams params,
  ) async {
    return await _repository.registerUser(params: params);
  }
}
