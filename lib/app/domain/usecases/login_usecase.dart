import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class LoginUsecase implements Usecase<LoginResponseEntity, LoginParams> {
  final UserRepository _repository;

  LoginUsecase({required UserRepository repository}) : _repository = repository;

  @override
  Future<EitherOf<Failure, LoginResponseEntity>> call(
    LoginParams params,
  ) async {
    return await _repository.loginUser(params: params);
  }
}
