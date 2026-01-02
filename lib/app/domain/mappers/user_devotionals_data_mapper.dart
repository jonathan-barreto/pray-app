import 'package:pray_app/app/data/models/user_devotionals_response_model.dart';
import 'package:pray_app/app/domain/entities/user_devotionals_data_entity.dart';
import 'package:pray_app/app/domain/mappers/devotional_mapper.dart';
import 'package:pray_app/app/domain/mappers/pagination_mapper.dart';

class UserDevotionalsDataMapper {
  static UserDevotionalsDataEntity fromModel(UserDevotionalsDataModel model) {
    return UserDevotionalsDataEntity(
      devotionals: model.devotionals
          .map((devotional) => DevotionalMapper.fromModel(devotional))
          .toList(),
      pagination: PaginationMapper.fromModel(model.pagination),
    );
  }

  static UserDevotionalsDataModel fromEntity(UserDevotionalsDataEntity entity) {
    return UserDevotionalsDataModel(
      devotionals: entity.devotionals
          .map((devotional) => DevotionalMapper.fromEntity(devotional))
          .toList(),
      pagination: PaginationMapper.fromEntity(entity.pagination),
    );
  }
}
