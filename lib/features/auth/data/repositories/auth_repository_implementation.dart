import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_datasource_implementation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> authenticateUser() async {
    try {
      await datasource.authenticateUser();
      return const Right(null);
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
