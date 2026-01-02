import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/domain/entities/dashboard_response_entity.dart';

abstract class DashboardRepository {
  Future<EitherOf<Failure, DashboardResponseEntity>> getDashboard();
}
