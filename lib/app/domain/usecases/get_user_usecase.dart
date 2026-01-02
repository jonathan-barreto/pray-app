import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/user_response_entity.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class GetUserUsecase implements Usecase<UserResponseEntity, NoParams> {
  final UserRepository _repository;

  GetUserUsecase({required UserRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, UserResponseEntity>> call(NoParams params) async {
    return await _repository.getUser();
  }
}
