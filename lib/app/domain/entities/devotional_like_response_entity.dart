import 'package:pray_app/app/domain/entities/devotional_like_data_entity.dart';

class DevotionalLikeResponseEntity {
  final bool success;
  final String message;
  final DevotionalLikeDataEntity data;

  const DevotionalLikeResponseEntity({
    required this.success,
    required this.message,
    required this.data,
  });
}
