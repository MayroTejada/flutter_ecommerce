import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/data/models/user_model.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/user.dart';

extension TokenMapper on Token {
  TokenModel toModel() {
    return TokenModel(accessToken: accessToken);
  }
}

extension TokenModelMapper on TokenModel {
  Token toEntity() {
    return Token(accessToken: accessToken);
  }
}

extension UserModelMapper on UserModel {
  User toEntity() {
    return User(id: id, email: email, password: password, username: username);
  }
}
