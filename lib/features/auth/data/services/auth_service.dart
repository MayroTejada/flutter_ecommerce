import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

abstract class FalseAuthService {
  Future<TokenModel> signUpUser(String email, String password, String username);
}

@Injectable(as: FalseAuthService)
class FalseAuthServiceImpl implements FalseAuthService {
  @override
  Future<TokenModel> signUpUser(
      String email, String password, String username) {
    var user = User(
        id: UniqueKey().toString(),
        password: password,
        email: email,
        username: username);
    return Future.delayed(const Duration(milliseconds: 100),
        () => TokenModel(accessToken: user.id ?? ''));
  }
}
