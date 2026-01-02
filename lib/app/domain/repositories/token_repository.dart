import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';

abstract class TokenRepository {
  Future<EitherOf<Failure, VoidSuccess>> saveToken({
    required TokenEntity token,
  });

  Future<EitherOf<Failure, TokenEntity?>> getToken();

  Future<EitherOf<Failure, VoidSuccess>> deleteToken();
}
