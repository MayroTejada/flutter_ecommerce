import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> checkAuthUser();
  Future<Either<Failure, void>> saveToken();
}
