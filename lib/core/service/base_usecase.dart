import 'package:dartz/dartz.dart';
import 'package:task_products/core/error/failure.dart';

abstract interface class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}
