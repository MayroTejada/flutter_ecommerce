import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/data/service/auth_hive_service.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDatasource {
  Future<TokenModel> getToken();
  Future<void> saveToken(TokenModel tokenModel);
}

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final AuthHiveService authHiveService;

  AuthLocalDatasourceImpl({required this.authHiveService});
  @override
  Future<TokenModel> getToken() async {
    return authHiveService.getToken();
  }

  @override
  Future<void> saveToken(TokenModel tokenModel) {
    return authHiveService.saveToken(tokenModel);
  }
}
