import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/devotional_response_entity.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class GetLatestPrivateDevotionalUsecase
    implements Usecase<DevotionalResponseEntity, NoParams> {
  final DevotionalRepository _repository;

  GetLatestPrivateDevotionalUsecase({required DevotionalRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, DevotionalResponseEntity>> call(
    NoParams params,
  ) async {
    return await _repository.getLatestPrivateDevotional();
  }
}
