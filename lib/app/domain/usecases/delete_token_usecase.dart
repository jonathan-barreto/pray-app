import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/repositories/token_repository.dart';

class DeleteTokenUsecase implements Usecase<VoidSuccess, NoParams> {
  final TokenRepository _repository;

  DeleteTokenUsecase({required TokenRepository repository})
      : _repository = repository;

  @override
  Future<EitherOf<Failure, VoidSuccess>> call(NoParams params) async {
    return await _repository.deleteToken();
  }
}
