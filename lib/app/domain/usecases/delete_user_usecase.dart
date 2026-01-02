import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/message_response_entity.dart';
import 'package:pray_app/app/domain/params/user_delete_params.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class DeleteUserUsecase
    implements Usecase<MessageResponseEntity, UserDeleteParams> {
  final UserRepository _repository;

  DeleteUserUsecase({required UserRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, MessageResponseEntity>> call(
    UserDeleteParams params,
  ) async {
    return await _repository.deleteUser(params: params);
  }
}
