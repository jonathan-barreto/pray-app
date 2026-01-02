import 'package:pray_app/app/data/models/dashboard_response_model.dart';
import 'package:pray_app/app/domain/entities/dashboard_response_entity.dart';
import 'package:pray_app/app/domain/mappers/dashboard_data_mapper.dart';

class DashboardResponseMapper {
  static DashboardResponseEntity fromModel(DashboardResponseModel model) {
    return DashboardResponseEntity(
      success: model.success,
      data: DashboardDataMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static DashboardResponseModel fromEntity(DashboardResponseEntity entity) {
    return DashboardResponseModel(
      success: entity.success,
      data: DashboardDataMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}
