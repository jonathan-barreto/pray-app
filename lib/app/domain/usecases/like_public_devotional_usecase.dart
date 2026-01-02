import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/devotional_like_response_entity.dart';
import 'package:pray_app/app/domain/params/devotional_like_params.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class LikePublicDevotionalUsecase
    implements
        Usecase<DevotionalLikeResponseEntity, PublicDevotionalLikeParams> {
  final DevotionalRepository _repository;

  LikePublicDevotionalUsecase({required DevotionalRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, DevotionalLikeResponseEntity>> call(
    PublicDevotionalLikeParams params,
  ) async {
    return await _repository.likePublicDevotional(params: params);
  }
}
