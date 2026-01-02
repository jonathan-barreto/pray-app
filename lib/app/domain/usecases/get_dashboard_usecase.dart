import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/dashboard_response_entity.dart';
import 'package:pray_app/app/domain/repositories/dashboard_repository.dart';

class GetDashboardUsecase
    implements Usecase<DashboardResponseEntity, NoParams> {
  final DashboardRepository _repository;

  GetDashboardUsecase({required DashboardRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, DashboardResponseEntity>> call(
    NoParams params,
  ) async {
    return await _repository.getDashboard();
  }
}
