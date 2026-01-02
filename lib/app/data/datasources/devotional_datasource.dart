import 'package:pray_app/app/core/consts/app_endpoints.dart';
import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/data/models/devotional_completion_response_model.dart';
import 'package:pray_app/app/data/models/devotional_feedback_response_model.dart';
import 'package:pray_app/app/data/models/devotional_like_response_model.dart';
import 'package:pray_app/app/data/models/devotional_response_model.dart';
import 'package:pray_app/app/data/models/generate_devotional_response_model.dart';
import 'package:pray_app/app/data/models/user_devotionals_response_model.dart';
import 'package:pray_app/app/domain/params/complete_devotional_params.dart';
import 'package:pray_app/app/domain/params/devotional_like_params.dart';
import 'package:pray_app/app/domain/params/generate_devotional_params.dart';
import 'package:pray_app/app/domain/params/submit_devotional_feedback_params.dart';

abstract class DevotionalDataSource {
  Future<UserDevotionalsResponseModel> getPrivateDevotionals({
    required int page,
  });

  Future<DevotionalResponseModel> getPrivateDevotionalById({required int id});

  Future<DevotionalResponseModel> getLatestPrivateDevotional();

  Future<GenerateDevotionalResponseModel> generateDevotional({
    required GenerateDevotionalParams params,
  });

  Future<DevotionalLikeResponseModel> likePrivateDevotional({
    required PrivateDevotionalLikeParams params,
  });

  Future<UserDevotionalsResponseModel> getLikedPrivateDevotionals({
    required int page,
  });

  Future<DevotionalLikeResponseModel> likePublicDevotional({
    required PublicDevotionalLikeParams params,
  });

  Future<UserDevotionalsResponseModel> getLikedPublicDevotionals({
    required int page,
  });

  Future<DevotionalFeedbackResponseModel> submitPublicFeedback({
    required SubmitDevotionalFeedbackParams params,
  });

  Future<DevotionalFeedbackResponseModel> submitPrivateFeedback({
    required SubmitDevotionalFeedbackParams params,
  });

  Future<DevotionalCompletionResponseModel> completeDevotional({
    required CompleteDevotionalParams params,
  });
}

class DevotionalDataSourceImpl implements DevotionalDataSource {
  final HttpClient _httpClient;

  DevotionalDataSourceImpl({required HttpClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<UserDevotionalsResponseModel> getPrivateDevotionals({
    required int page,
  }) async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: '${AppEndpoints.privateDevotionals}?page=$page',
      );

      return UserDevotionalsResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<DevotionalResponseModel> getPrivateDevotionalById({
    required int id,
  }) async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: '${AppEndpoints.privateDevotional}/$id',
      );

      return DevotionalResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<DevotionalResponseModel> getLatestPrivateDevotional() async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: AppEndpoints.latestPrivateDevotional,
      );

      return DevotionalResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<GenerateDevotionalResponseModel> generateDevotional({
    required GenerateDevotionalParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.privateDevotionalCreate,
        body: params.toMap(),
      );

      return GenerateDevotionalResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<DevotionalLikeResponseModel> likePrivateDevotional({
    required PrivateDevotionalLikeParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.privateDevotionalLike,
        body: params.toMap(),
      );

      return DevotionalLikeResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<UserDevotionalsResponseModel> getLikedPrivateDevotionals({
    required int page,
  }) async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: '${AppEndpoints.privateDevotionalLiked}?page=$page',
      );

      return UserDevotionalsResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<DevotionalLikeResponseModel> likePublicDevotional({
    required PublicDevotionalLikeParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.publicDevotionalLike,
        body: params.toMap(),
      );

      return DevotionalLikeResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<UserDevotionalsResponseModel> getLikedPublicDevotionals({
    required int page,
  }) async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: '${AppEndpoints.publicDevotionalLiked}?page=$page',
      );

      return UserDevotionalsResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<DevotionalFeedbackResponseModel> submitPublicFeedback({
    required SubmitDevotionalFeedbackParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.publicDevotionalFeedback,
        body: params.toMap(),
      );

      return DevotionalFeedbackResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<DevotionalFeedbackResponseModel> submitPrivateFeedback({
    required SubmitDevotionalFeedbackParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.privateDevotionalFeedback,
        body: params.toMap(),
      );

      return DevotionalFeedbackResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<DevotionalCompletionResponseModel> completeDevotional({
    required CompleteDevotionalParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.devotionalCompletion,
        body: params.toMap(),
      );

      return DevotionalCompletionResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
