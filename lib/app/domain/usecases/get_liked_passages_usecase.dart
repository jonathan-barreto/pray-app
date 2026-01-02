import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/passages_response_entity.dart';
import 'package:pray_app/app/domain/repositories/passage_repository.dart';

class GetLikedPassagesUsecase implements Usecase<PassagesResponseEntity, int> {
  final PassageRepository _repository;

  GetLikedPassagesUsecase({required PassageRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, PassagesResponseEntity>> call(int page) async {
    return await _repository.getLikedPassages(page: page);
  }
}
