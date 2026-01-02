import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/devotional_response_entity.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';

class GetPrivateDevotionalByIdUsecase
    implements Usecase<DevotionalResponseEntity, int> {
  final DevotionalRepository _repository;

  GetPrivateDevotionalByIdUsecase({required DevotionalRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, DevotionalResponseEntity>> call(int id) async {
    return await _repository.getPrivateDevotionalById(id: id);
  }
}
