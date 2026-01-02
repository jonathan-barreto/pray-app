import 'package:pray_app/app/data/models/passages_response_model.dart';
import 'package:pray_app/app/domain/entities/passages_response_entity.dart';
import 'package:pray_app/app/domain/mappers/pagination_mapper.dart';
import 'package:pray_app/app/domain/mappers/passage_mapper.dart';

class PassagesResponseMapper {
  static PassagesResponseEntity fromModel(PassagesResponseModel model) {
    return PassagesResponseEntity(
      success: model.success,
      data: PassagesDataMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static PassagesResponseModel fromEntity(PassagesResponseEntity entity) {
    return PassagesResponseModel(
      success: entity.success,
      data: PassagesDataMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}

class PassagesDataMapper {
  static PassagesDataEntity fromModel(PassagesDataModel model) {
    return PassagesDataEntity(
      passages: model.passages.map((p) => PassageMapper.fromModel(p)).toList(),
      pagination: PaginationMapper.fromModel(model.pagination),
    );
  }

  static PassagesDataModel fromEntity(PassagesDataEntity entity) {
    return PassagesDataModel(
      passages: entity.passages
          .map((p) => PassageMapper.fromEntity(p))
          .toList(),
      pagination: PaginationMapper.fromEntity(entity.pagination),
    );
  }
}
