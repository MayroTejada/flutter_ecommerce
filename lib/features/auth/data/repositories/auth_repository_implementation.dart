import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ecommerce/features/auth/data/mappers/auth_mappers.dart';
import 'package:flutter_ecommerce/features/auth/data/models/user_model.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource remoteDataSource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.localDatasource});

  @override
  Future<Either<Failure, void>> checkAuthUser() async {
    try {
      var res = await localDatasource.getToken();
      if (res != null) {
        return const Right(null);
      } else {
        return const Left(Failure());
      }
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveToken(Token token) async {
    try {
      await localDatasource.saveToken(token.toModel());
      return const Right(null);
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUpUser(
      String email, String password, String username) async {
    try {
      var res = await localDatasource.signUpUser(email, password, username);
      return Right(res.toEntity());
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, User>> signInUser(String email, String password) {
    // TODO: implement signInUser
    throw UnimplementedError();
  }
}
