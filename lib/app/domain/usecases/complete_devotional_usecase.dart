import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/devotional_completion_response_entity.dart';
import 'package:pray_app/app/domain/params/complete_devotional_params.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class CompleteDevotionalUsecase
    implements
        Usecase<DevotionalCompletionResponseEntity, CompleteDevotionalParams> {
  final DevotionalRepository _repository;

  CompleteDevotionalUsecase({required DevotionalRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, DevotionalCompletionResponseEntity>> call(
    CompleteDevotionalParams params,
  ) async {
    return await _repository.completeDevotional(params: params);
  }
}
