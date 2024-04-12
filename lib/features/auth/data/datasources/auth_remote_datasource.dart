import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/data/services/auth_service.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDatasource {
  Future<void> checkAuthenticateUser();
  Future<TokenModel> signUpUser(String email, String password, String username);
}

@Injectable(as: AuthDatasource)
class AuthDatasourceImpl implements AuthDatasource {
  final FalseAuthService falseAuthService;
  AuthDatasourceImpl({required this.falseAuthService});

  @override
  Future<void> checkAuthenticateUser() async {}

  @override
  Future<TokenModel> signUpUser(
      String email, String password, String username) async {
    return falseAuthService.signUpUser(email, password, username);
  }
}
