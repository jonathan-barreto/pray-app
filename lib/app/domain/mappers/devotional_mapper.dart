import 'package:pray_app/app/data/models/devotional_model.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class DevotionalMapper {
  static DevotionalEntity fromModel(DevotionalModel model) {
    return DevotionalEntity(
      id: model.id,
      userId: model.userId,
      title: model.title,
      verseReference: model.verseReference,
      verseText: model.verseText,
      reflection: model.reflection,
      application: model.application,
      prayer: model.prayer,
      readingTimeEstimate: model.readingTimeEstimate,
      evaluationNote: model.evaluationNote,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      description: model.description,
      feeling: model.feeling,
      processing: model.processing,
      liked: model.liked,
    );
  }

  static DevotionalModel fromEntity(DevotionalEntity entity) {
    return DevotionalModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      verseReference: entity.verseReference,
      verseText: entity.verseText,
      reflection: entity.reflection,
      application: entity.application,
      prayer: entity.prayer,
      readingTimeEstimate: entity.readingTimeEstimate,
      evaluationNote: entity.evaluationNote,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      description: entity.description,
      feeling: entity.feeling,
      processing: entity.processing,
      liked: entity.liked,
    );
  }
}
