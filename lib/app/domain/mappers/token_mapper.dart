import 'package:pray_app/app/data/models/token_model.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';

class TokenMapper {
  static TokenEntity fromModel(TokenModel model) {
    return TokenEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }

  static TokenModel fromEntity(TokenEntity entity) {
    return TokenModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }
}
