import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/user_devotionals_response_entity.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class GetLikedPublicDevotionalsUsecase
    implements Usecase<UserDevotionalsResponseEntity, int> {
  final DevotionalRepository _repository;

  GetLikedPublicDevotionalsUsecase({required DevotionalRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, UserDevotionalsResponseEntity>> call(
    int page,
  ) async {
    return await _repository.getLikedPublicDevotionals(page: page);
  }
}
