
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ecommerce/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthLocalDatasource>()])
@GenerateNiceMocks([MockSpec<AuthDatasource>()])
void main() {
  late MockAuthDatasource authDatasourceMock;
  late MockAuthLocalDatasource authLocalDatasource;
  late AuthRepositoryImpl repository;

  setUp(() {
    authDatasourceMock = MockAuthDatasource();
    authLocalDatasource = MockAuthLocalDatasource();
    repository = AuthRepositoryImpl(
        datasource: authDatasourceMock, localDatasource: authLocalDatasource);
  });
  group("device is offline", () {
    test('if token exists in local datasource should return void', () async {
      //arrange
      when(authLocalDatasource.checkAuthenticateUser())
          .thenAnswer((_) async {});

      //act
      final result = await repository.checkAuthUser();

      //assert
      expect(result, equals(const Right(null)));
    });
  });
}
