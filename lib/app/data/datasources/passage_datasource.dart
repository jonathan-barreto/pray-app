import 'package:pray_app/app/core/consts/app_endpoints.dart';
import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/data/models/passage_like_response_model.dart';
import 'package:pray_app/app/data/models/passages_response_model.dart';
import 'package:pray_app/app/domain/params/passage_like_params.dart';

abstract class PassageDataSource {
  Future<PassagesResponseModel> getLikedPassages({required int page});
  
  Future<PassageLikeResponseModel> likePassage({
    required PassageLikeParams params,
  });
}

class PassageDataSourceImpl implements PassageDataSource {
  final HttpClient _httpClient;

  PassageDataSourceImpl({required HttpClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<PassagesResponseModel> getLikedPassages({required int page}) async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: '${AppEndpoints.passageLiked}?page=$page',
      );

      return PassagesResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<PassageLikeResponseModel> likePassage({
    required PassageLikeParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.passageLike,
        body: params.toMap(),
      );

      return PassageLikeResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
