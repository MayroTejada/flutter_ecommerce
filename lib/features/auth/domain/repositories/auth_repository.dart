import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> checkAuthUser();
  Future<Either<Failure, void>> saveToken(Token token);
}
