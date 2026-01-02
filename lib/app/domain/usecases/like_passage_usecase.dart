import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/passage_like_response_entity.dart';
import 'package:pray_app/app/domain/params/passage_like_params.dart';
import 'package:pray_app/app/domain/repositories/passage_repository.dart';

class LikePassageUsecase
    implements Usecase<PassageLikeResponseEntity, PassageLikeParams> {
  final PassageRepository _repository;

  LikePassageUsecase({required PassageRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, PassageLikeResponseEntity>> call(
    PassageLikeParams params,
  ) async {
    return await _repository.likePassage(params: params);
  }
}
