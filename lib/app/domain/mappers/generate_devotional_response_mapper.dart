import 'package:pray_app/app/data/models/generate_devotional_response_model.dart';
import 'package:pray_app/app/domain/entities/generate_devotional_response_entity.dart';
import 'package:pray_app/app/domain/mappers/devotional_mapper.dart';

class GenerateDevotionalResponseMapper {
  static GenerateDevotionalResponseEntity fromModel(
    GenerateDevotionalResponseModel model,
  ) {
    return GenerateDevotionalResponseEntity(
      success: model.success,
      data: DevotionalMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static GenerateDevotionalResponseModel fromEntity(
    GenerateDevotionalResponseEntity entity,
  ) {
    return GenerateDevotionalResponseModel(
      success: entity.success,
      data: DevotionalMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}
