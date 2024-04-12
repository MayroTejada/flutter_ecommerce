import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../datasources/authentication_local_datasource_test.mocks.dart';
import 'authentication_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthLocalDatasource>()])
@GenerateNiceMocks([MockSpec<AuthDatasource>()])
void main() {
  late MockAuthDatasource authDatasourceMock;
  late MockAuthLocalDatasource authLocalDatasource;
  late AuthRepositoryImpl repository;
  late Box<TokenModel> tokenBox;
  late TokenModel token;
  setUp(() {
    token = TokenModel(accessToken: 'example');
    authDatasourceMock = MockAuthDatasource();
    tokenBox = MockBox()..add(TokenModel(accessToken: ''));
    authLocalDatasource = MockAuthLocalDatasource();
    repository = AuthRepositoryImpl(
        remoteDataSource: authDatasourceMock,
        localDatasource: authLocalDatasource);
  });
  group("device is offline", () {
    test('if token exists in local datasource should return void', () async {
      //arrange
      when(authLocalDatasource.getToken()).thenAnswer((_) async => token);

      //act
      final result = await repository.checkAuthUser();

      //assert
      expect(result, equals(const Right(null)));
    });
  });
  group("device is offline", () {
    test('if token its saved correctly return Right(null)', () async {
      //arrange
      when(authLocalDatasource.saveToken(token)).thenAnswer((_) async {});

      //act
      final result = await repository.saveToken(Token(accessToken: 'example'));

      //assert
      expect(result, equals(const Right(null)));
    });
  });
}
