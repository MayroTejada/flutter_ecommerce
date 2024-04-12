import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'authentication_local_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Box>()])
@GenerateNiceMocks([MockSpec<HiveInterface>()])
void main() {
  late AuthLocalDatasourceImpl authLocalDatasource;
  late Box<TokenModel> boxToken;
  late TokenModel tokenModel;
  late HiveInterface mockHiveInterface;
  setUp(() {
    tokenModel = TokenModel.fromJson({'token': 'algo'});
    boxToken = MockBox();
    mockHiveInterface = MockHiveInterface();
    authLocalDatasource =
        AuthLocalDatasourceImpl(hiveInterface: mockHiveInterface);
  });
  group('getLastToken', () {
    test('should return last stored token (cached)', () async {
      //arrage
      when(mockHiveInterface.openBox('tokens'))
          .thenAnswer((_) async => boxToken);
      when(boxToken.get('token')).thenAnswer((realInvocation) => tokenModel);
      // act
      final result = await authLocalDatasource.getToken();

      //assert
      verify(mockHiveInterface.openBox('tokens'));
    });

    test('should return a Cache Failure when there is no stored token',
        () async {
      //arrange
      when(mockHiveInterface.openBox('tokens'))
          .thenAnswer((_) async => boxToken);
      when(boxToken.isEmpty).thenAnswer((realInvocation) => true);

      //act
      final call = await authLocalDatasource.getToken();

      //assert
      expect(authLocalDatasource.getToken(), throwsException);
    });
  });

  group('cacheToken', () {
    test('should store the token', () async {
      when(mockHiveInterface.openBox('tokens'))
          .thenAnswer((_) async => boxToken);
      //act
      authLocalDatasource.saveToken(tokenModel);

      //assert
      verify(mockHiveInterface.openBox('tokens'));
    });
  });
}
