import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> checkAuthUser();
  Future<Either<Failure, void>> saveToken(Token token);
  Future<Either<Failure, User>> signUpUser(
      String email, String password, String username);
  Future<Either<Failure, User>> signInUser(String email, String password);
}
