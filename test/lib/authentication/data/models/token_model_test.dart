import 'dart:convert';

import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture_reader.dart';

void main() {
  TokenModel tTokenModel = TokenModel(accessToken: "1234");

  test('should be a subclass of token entity', () async {
    //assert
    expect(tTokenModel, isA<TokenModel>());
  });

  group('fromJson', () {
    test('should return a valid model when a valid JSON is given', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture("user_login.json"));

      //act
      final result = TokenModel.fromJson(jsonMap);

      //assert
      expect(result, equals(tTokenModel));
    });

    test('should return a null token when a token is not given in the JSON',
        () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture("user_login_null_token.json"));

      //act
      final result = TokenModel.fromJson(jsonMap);

      //assert
      expect(result, equals(TokenModel(accessToken: '')));
    });
  });

  group("toJson", () {
    test('should return a valid map when called the toJson method', () async {
      //act
      final result = tTokenModel.toJson();

      //assert
      final expectedMap = {
        'access_token': '1234',
        'token_type': null,
        'expires_in': null
      };
      expect(result, equals(expectedMap));
    });
  });
}
