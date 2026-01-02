import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/data/datasources/devotional_datasource.dart';
import 'package:pray_app/app/data/models/devotional_completion_response_model.dart';
import 'package:pray_app/app/data/models/devotional_feedback_response_model.dart';
import 'package:pray_app/app/domain/entities/devotional_completion_response_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_feedback_response_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_like_response_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_response_entity.dart';
import 'package:pray_app/app/domain/entities/generate_devotional_response_entity.dart';
import 'package:pray_app/app/domain/entities/user_devotionals_response_entity.dart';
import 'package:pray_app/app/domain/mappers/devotional_completion_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/devotional_feedback_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/devotional_like_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/devotional_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/generate_devotional_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/user_devotionals_response_mapper.dart';
import 'package:pray_app/app/domain/params/complete_devotional_params.dart';
import 'package:pray_app/app/domain/params/devotional_like_params.dart';
import 'package:pray_app/app/domain/params/generate_devotional_params.dart';
import 'package:pray_app/app/domain/params/submit_devotional_feedback_params.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class DevotionalRepositoryImpl implements DevotionalRepository {
  final DevotionalDataSource _remoteDataSource;

  DevotionalRepositoryImpl({required DevotionalDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<EitherOf<Failure, UserDevotionalsResponseEntity>>
  getPrivateDevotionals({required int page}) async {
    try {
      final responseModel = await _remoteDataSource.getPrivateDevotionals(
        page: page,
      );
      final responseEntity = UserDevotionalsResponseMapper.fromModel(
        responseModel,
      );
      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, DevotionalResponseEntity>> getPrivateDevotionalById({
    required int id,
  }) async {
    try {
      final responseModel = await _remoteDataSource.getPrivateDevotionalById(
        id: id,
      );
      final responseEntity = DevotionalResponseMapper.fromModel(responseModel);
      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, DevotionalResponseEntity>>
  getLatestPrivateDevotional() async {
    try {
      final responseModel = await _remoteDataSource
          .getLatestPrivateDevotional();
      final responseEntity = DevotionalResponseMapper.fromModel(responseModel);
      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, GenerateDevotionalResponseEntity>>
  generateDevotional({required GenerateDevotionalParams params}) async {
    try {
      final responseModel = await _remoteDataSource.generateDevotional(
        params: params,
      );
      final responseEntity = GenerateDevotionalResponseMapper.fromModel(
        responseModel,
      );
      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, DevotionalLikeResponseEntity>>
  likePrivateDevotional({required PrivateDevotionalLikeParams params}) async {
    try {
      final responseModel = await _remoteDataSource.likePrivateDevotional(
        params: params,
      );
      final responseEntity = DevotionalLikeResponseMapper.fromModel(
        responseModel,
      );
      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, UserDevotionalsResponseEntity>>
  getLikedPrivateDevotionals({required int page}) async {
    try {
      final responseModel = await _remoteDataSource.getLikedPrivateDevotionals(
        page: page,
      );
      final responseEntity = UserDevotionalsResponseMapper.fromModel(
        responseModel,
      );
      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, DevotionalLikeResponseEntity>> likePublicDevotional({
    required PublicDevotionalLikeParams params,
  }) async {
    try {
      final responseModel = await _remoteDataSource.likePublicDevotional(
        params: params,
      );
      final responseEntity = DevotionalLikeResponseMapper.fromModel(
        responseModel,
      );
      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, UserDevotionalsResponseEntity>>
  getLikedPublicDevotionals({required int page}) async {
    try {
      final responseModel = await _remoteDataSource.getLikedPublicDevotionals(
        page: page,
      );
      final responseEntity = UserDevotionalsResponseMapper.fromModel(
        responseModel,
      );
      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, DevotionalFeedbackResponseEntity>>
  submitPublicFeedback({required SubmitDevotionalFeedbackParams params}) async {
    try {
      final DevotionalFeedbackResponseModel responseModel =
          await _remoteDataSource.submitPublicFeedback(params: params);

      final DevotionalFeedbackResponseEntity responseEntity =
          DevotionalFeedbackResponseMapper.fromModel(responseModel);

      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, DevotionalFeedbackResponseEntity>>
  submitPrivateFeedback({
    required SubmitDevotionalFeedbackParams params,
  }) async {
    try {
      final DevotionalFeedbackResponseModel responseModel =
          await _remoteDataSource.submitPrivateFeedback(params: params);

      final DevotionalFeedbackResponseEntity responseEntity =
          DevotionalFeedbackResponseMapper.fromModel(responseModel);

      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }

  @override
  Future<EitherOf<Failure, DevotionalCompletionResponseEntity>>
  completeDevotional({required CompleteDevotionalParams params}) async {
    try {
      final DevotionalCompletionResponseModel responseModel =
          await _remoteDataSource.completeDevotional(params: params);

      final DevotionalCompletionResponseEntity responseEntity =
          DevotionalCompletionResponseMapper.fromModel(responseModel);

      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }
}
