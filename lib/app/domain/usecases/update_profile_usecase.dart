import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/user_response_entity.dart';
import 'package:pray_app/app/domain/params/profile_update_params.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';

class UpdateProfileUsecase
    implements Usecase<UserResponseEntity, ProfileUpdateParams> {
  final UserRepository _repository;

  UpdateProfileUsecase({required UserRepository repository})
    : _repository = repository;

  @override
  Future<EitherOf<Failure, UserResponseEntity>> call(
    ProfileUpdateParams params,
  ) async {
    return await _repository.updateUserProfile(params: params);
  }
}
