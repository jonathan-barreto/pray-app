import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class GenerateDevotionalResponseEntity {
  final bool success;
  final DevotionalEntity data;
  final String message;

  const GenerateDevotionalResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}
