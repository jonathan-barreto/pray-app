import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';
import 'package:pray_app/app/domain/repositories/token_repository.dart';

class SaveTokenUsecase implements Usecase<VoidSuccess, TokenEntity> {
  SaveTokenUsecase({required TokenRepository repository})
    : _repository = repository;

  final TokenRepository _repository;

  @override
  Future<EitherOf<Failure, VoidSuccess>> call(TokenEntity params) async {
    return await _repository.saveToken(token: params);
  }
}
