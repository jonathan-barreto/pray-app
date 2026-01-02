import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/data/datasources/dashboard_datasource.dart';
import 'package:pray_app/app/data/models/dashboard_response_model.dart';
import 'package:pray_app/app/domain/entities/dashboard_response_entity.dart';
import 'package:pray_app/app/domain/mappers/dashboard_response_mapper.dart';
import 'package:pray_app/app/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDataSource _remoteDataSource;

  DashboardRepositoryImpl({required DashboardDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<EitherOf<Failure, DashboardResponseEntity>> getDashboard() async {
    try {
      final DashboardResponseModel responseModel =
          await _remoteDataSource.getDashboard();

      final DashboardResponseEntity responseEntity =
          DashboardResponseMapper.fromModel(responseModel);

      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }
}
