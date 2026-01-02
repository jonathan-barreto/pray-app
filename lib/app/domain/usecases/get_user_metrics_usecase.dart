import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/user_metrics_response_entity.dart';
import 'package:pray_app/app/domain/params/get_user_metrics_params.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class GetUserMetricsUsecase
    implements Usecase<UserMetricsResponseEntity, GetUserMetricsParams> {
  final UserRepository _repository;

  GetUserMetricsUsecase({required UserRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, UserMetricsResponseEntity>> call(
    GetUserMetricsParams params,
  ) async {
    return await _repository.getUserMetrics(userId: params.userId);
  }
}
