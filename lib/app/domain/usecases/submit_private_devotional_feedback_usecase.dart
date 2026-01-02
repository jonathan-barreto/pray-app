import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/devotional_feedback_response_entity.dart';
import 'package:pray_app/app/domain/params/submit_devotional_feedback_params.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class SubmitPrivateDevotionalFeedbackUsecase
    implements
        Usecase<
          DevotionalFeedbackResponseEntity,
          SubmitDevotionalFeedbackParams
        > {
  final DevotionalRepository _repository;

  SubmitPrivateDevotionalFeedbackUsecase({
    required DevotionalRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, DevotionalFeedbackResponseEntity>> call(
    SubmitDevotionalFeedbackParams params,
  ) async {
    return await _repository.submitPrivateFeedback(params: params);
  }
}
