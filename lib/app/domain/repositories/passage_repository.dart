import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/domain/entities/passage_like_response_entity.dart';
import 'package:pray_app/app/domain/entities/passages_response_entity.dart';
import 'package:pray_app/app/domain/params/passage_like_params.dart';

abstract class PassageRepository {
  Future<EitherOf<Failure, PassagesResponseEntity>> getLikedPassages({
    required int page,
  });

  Future<EitherOf<Failure, PassageLikeResponseEntity>> likePassage({
    required PassageLikeParams params,
  });
}
