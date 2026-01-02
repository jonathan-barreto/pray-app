import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/data/datasources/passage_datasource.dart';
import 'package:pray_app/app/data/models/passage_like_response_model.dart';
import 'package:pray_app/app/data/models/passages_response_model.dart';
import 'package:pray_app/app/domain/entities/passage_like_response_entity.dart';
import 'package:pray_app/app/domain/entities/passages_response_entity.dart';
import 'package:pray_app/app/domain/mappers/passage_like_response_mapper.dart';
import 'package:pray_app/app/domain/mappers/passages_response_mapper.dart';
import 'package:pray_app/app/domain/params/passage_like_params.dart';
import 'package:pray_app/app/domain/repositories/passage_repository.dart';

class PassageRepositoryImpl implements PassageRepository {
  final PassageDataSource _remoteDataSource;

  PassageRepositoryImpl({required PassageDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<EitherOf<Failure, PassagesResponseEntity>> getLikedPassages({
    required int page,
  }) async {
    try {
      final PassagesResponseModel responseModel = await _remoteDataSource
          .getLikedPassages(page: page);

      final PassagesResponseEntity responseEntity =
          PassagesResponseMapper.fromModel(responseModel);

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
  Future<EitherOf<Failure, PassageLikeResponseEntity>> likePassage({
    required PassageLikeParams params,
  }) async {
    try {
      final PassageLikeResponseModel responseModel = await _remoteDataSource
          .likePassage(params: params);

      final PassageLikeResponseEntity responseEntity =
          PassageLikeResponseMapper.fromModel(responseModel);

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
