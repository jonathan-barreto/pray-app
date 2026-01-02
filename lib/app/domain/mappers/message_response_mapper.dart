import 'package:pray_app/app/data/models/message_response_model.dart';
import 'package:pray_app/app/domain/entities/message_response_entity.dart';

class MessageResponseMapper {
  static MessageResponseEntity fromModel(MessageResponseModel model) {
    return MessageResponseEntity(
      success: model.success,
      message: model.message,
    );
  }

  static MessageResponseModel fromEntity(MessageResponseEntity entity) {
    return MessageResponseModel(
      success: entity.success,
      message: entity.message,
    );
  }
}
