import 'package:pray_app/app/domain/entities/dashboard_data_entity.dart';

class DashboardResponseEntity {
  final bool success;
  final DashboardDataEntity data;
  final String message;

  const DashboardResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}
