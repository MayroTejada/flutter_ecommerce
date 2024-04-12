import 'dart:convert';

import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture_reader.dart';

void main() {
  TokenModel tTokenModel = TokenModel(accessToken: "algo");

  test('should be a subclass of token entity', () async {
    //assert
    expect(tTokenModel, isA<TokenModel>());
  });

  group('fromJson', () {
    test('should return a valid model when a valid JSON is given', () async {
      //arrange
      final Map<String, dynamic> jsonMap = jsonDecode('''{"token":"algo"}''');

      //act
      final result = TokenModel.fromJson(jsonMap);

      //assert
      expect(result, isA<TokenModel>());
    });

    test('should return a null token when a token is not given in the JSON',
        () async {
      //arrange
      final Map<String, dynamic> jsonMap = jsonDecode('''{"token":"algo"}''');

      //act
      final result = TokenModel.fromJson(jsonMap);

      //assert
      expect(result, isA<TokenModel>());
    });
  });

  group("toJson", () {
    test('should return a valid map when called the toJson method', () async {
      //act
      final result = tTokenModel.toJson();

      //assert
      final expectedMap = {
        'token': 'algo',
      };
      expect(result, equals(expectedMap));
    });
  });
}
