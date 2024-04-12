import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';

extension TokenMapper on Token {
  TokenModel toModel() {
    return TokenModel(accessToken: accessToken);
  }
}
