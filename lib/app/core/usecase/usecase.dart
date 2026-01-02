import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';

abstract class Usecase<Output, Input> {
  Future<EitherOf<Failure, Output>> call(Input params);
}

class NoParams {}
