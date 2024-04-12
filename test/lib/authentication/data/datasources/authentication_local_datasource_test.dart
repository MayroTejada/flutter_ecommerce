import 'dart:convert';

import 'package:flutter_ecommerce/core/failures/failure.dart';
import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

import '../../../fixture_reader.dart';


class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

void main() {

  group('getLastToken', () {
    final TokenModel tTokenModel =
        TokenModel.fromJson(jsonDecode(fixture('user_login.json')));

    test('should return last stored token (cached)', () async {
      //arrage
      when(mockSecureStorage.read(key: storageDefaultAuthToken))
          .thenAnswer((_) async => fixture('user_login.json'));

      // act
      final result = await dataSourceImpl.getToken();

      //assert
      verify(mockSecureStorage.read(key: storageDefaultAuthToken));
      expect(result, tTokenModel);
    });

    test('should return a Cache Failure when there is no stored token',
        () async {
      //arrange
      when(mockSecureStorage.read(key: storageDefaultAuthToken))
          .thenThrow(CacheFailure());

      //act
      final call = dataSourceImpl.getToken;

      //assert
      expect(call, throwsA(isA<CacheFailure>()));
    });
  });

  group('cacheToken', () {
    const TokenModel tTokenModel = TokenModel(accessToken: '123456');

    test('should store the token', () async {
      //act
      dataSourceImpl.keepCachedToken(tTokenModel);

      //assert
      verify(mockSecureStorage.write(
          key: storageDefaultAuthToken, value: jsonEncode(tTokenModel)));
    });
  });
}
