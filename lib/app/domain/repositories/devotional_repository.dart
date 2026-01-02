import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/domain/entities/devotional_completion_response_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_feedback_response_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_like_response_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_response_entity.dart';
import 'package:pray_app/app/domain/entities/generate_devotional_response_entity.dart';
import 'package:pray_app/app/domain/entities/user_devotionals_response_entity.dart';
import 'package:pray_app/app/domain/params/complete_devotional_params.dart';
import 'package:pray_app/app/domain/params/devotional_like_params.dart';
import 'package:pray_app/app/domain/params/generate_devotional_params.dart';
import 'package:pray_app/app/domain/params/submit_devotional_feedback_params.dart';

abstract class DevotionalRepository {
  Future<EitherOf<Failure, UserDevotionalsResponseEntity>>
  getPrivateDevotionals({required int page});

  Future<EitherOf<Failure, DevotionalResponseEntity>> getPrivateDevotionalById({
    required int id,
  });

  Future<EitherOf<Failure, DevotionalResponseEntity>>
  getLatestPrivateDevotional();

  Future<EitherOf<Failure, GenerateDevotionalResponseEntity>>
  generateDevotional({required GenerateDevotionalParams params});

  Future<EitherOf<Failure, DevotionalLikeResponseEntity>>
  likePrivateDevotional({required PrivateDevotionalLikeParams params});

  Future<EitherOf<Failure, UserDevotionalsResponseEntity>>
  getLikedPrivateDevotionals({required int page});

  Future<EitherOf<Failure, DevotionalLikeResponseEntity>> likePublicDevotional({
    required PublicDevotionalLikeParams params,
  });

  Future<EitherOf<Failure, UserDevotionalsResponseEntity>>
  getLikedPublicDevotionals({required int page});

  Future<EitherOf<Failure, DevotionalFeedbackResponseEntity>>
  submitPublicFeedback({required SubmitDevotionalFeedbackParams params});

  Future<EitherOf<Failure, DevotionalFeedbackResponseEntity>>
  submitPrivateFeedback({required SubmitDevotionalFeedbackParams params});

  Future<EitherOf<Failure, DevotionalCompletionResponseEntity>>
  completeDevotional({required CompleteDevotionalParams params});
}
