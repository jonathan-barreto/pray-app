import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/devotional_like_response_entity.dart';
import 'package:pray_app/app/domain/params/devotional_like_params.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class LikePrivateDevotionalUsecase
    implements
        Usecase<DevotionalLikeResponseEntity, PrivateDevotionalLikeParams> {
  final DevotionalRepository _repository;

  LikePrivateDevotionalUsecase({required DevotionalRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, DevotionalLikeResponseEntity>> call(
    PrivateDevotionalLikeParams params,
  ) async {
    return await _repository.likePrivateDevotional(params: params);
  }
}
