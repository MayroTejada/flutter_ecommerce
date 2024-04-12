import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_datasource_implementation.dart';
import 'package:flutter_ecommerce/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AuthDatasourceMock extends Mock implements AuthDatasource {}

void main() {
  late AuthDatasourceMock authDatasourceMock;
  authDatasourceMock = AuthDatasourceMock();
  AuthRepositoryImpl repository =
      AuthRepositoryImpl(datasource: authDatasourceMock);

  group("device is offline", () {
    //   test('if token exists in local datasource should return void', () async {
    //     //arrange
    //     when(authDatasourceMock.getToken()).thenAnswer((_) async => tTokenModel);

    //     //act
    //     final result = await repository.fetchCachedToken();

    //     //assert
    //     expect(result, equals(const Right(tToken)));
    //   });
    // });
  });
}
