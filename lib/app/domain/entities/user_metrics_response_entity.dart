import 'package:pray_app/app/domain/entities/user_metrics_entity.dart';

class UserMetricsResponseEntity {
  final bool success;
  final UserMetricsEntity data;
  final String message;

  const UserMetricsResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}
