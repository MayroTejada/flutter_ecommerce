import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl({required this.datasource, required this.localDatasource});

  @override
  Future<Either<Failure, void>> checkAuthUser() async {
    try {
      await localDatasource.checkAuthenticateUser();
      return const Right(null);
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveToken(Token token) {
    // TODO: implement saveToken
    throw UnimplementedError();
  }
}
