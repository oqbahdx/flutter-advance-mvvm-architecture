import 'package:advanced/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseBase<In,Out> {

  Future<Either<Failure,Out>> execute(In input);
}