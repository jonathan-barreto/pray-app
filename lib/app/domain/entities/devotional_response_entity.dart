import 'package:pray_app/app/domain/entities/devotional_entity.dart';

class DevotionalResponseEntity {
  final bool success;
  final DevotionalEntity data;
  final String message;

  const DevotionalResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}
