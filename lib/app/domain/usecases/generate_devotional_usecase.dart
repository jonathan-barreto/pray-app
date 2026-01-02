import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/generate_devotional_response_entity.dart';
import 'package:pray_app/app/domain/params/generate_devotional_params.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class GenerateDevotionalUsecase
    implements
        Usecase<GenerateDevotionalResponseEntity, GenerateDevotionalParams> {
  final DevotionalRepository _repository;

  GenerateDevotionalUsecase({required DevotionalRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, GenerateDevotionalResponseEntity>> call(
    GenerateDevotionalParams params,
  ) async {
    return await _repository.generateDevotional(params: params);
  }
}
