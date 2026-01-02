import 'package:pray_app/app/data/models/passage_model.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';

class PassageMapper {
  static PassageEntity fromModel(PassageModel model) {
    return PassageEntity(
      id: model.id,
      verseReference: model.verseReference,
      verseText: model.verseText,
      readingTimeEstimate: model.readingTimeEstimate,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      description: model.description,
      liked: model.liked,
    );
  }

  static PassageModel fromEntity(PassageEntity entity) {
    return PassageModel(
      id: entity.id,
      verseReference: entity.verseReference,
      verseText: entity.verseText,
      readingTimeEstimate: entity.readingTimeEstimate,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      description: entity.description,
      liked: entity.liked,
    );
  }
}
