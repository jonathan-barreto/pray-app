import 'package:pray_app/app/domain/entities/user_metrics_entity.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String createdAt;
  final String updatedAt;
  final UserMetricsEntity? metrics;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    this.metrics,
  });

  String getInitials() {
    if (name.isEmpty) return '';

    final nameParts = name.split(' ');
    if (nameParts.length == 1) {
      return nameParts[0][0].toUpperCase();
    }

    return nameParts[0][0].toUpperCase() +
        nameParts[nameParts.length - 1][0].toUpperCase();
  }

  String getFirstName() {
    if (name.isEmpty) return '';

    return name.split(' ')[0];
  }
}
