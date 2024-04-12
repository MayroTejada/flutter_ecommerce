import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDatasource {
  Future<Box<TokenModel>> getToken();
  Future<void> saveToken(TokenModel tokenModel);
}

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final HiveInterface hiveInterface;

  AuthLocalDatasourceImpl({required this.hiveInterface});
  @override
  Future<Box<TokenModel>> getToken() async {
    return hiveInterface.openBox<TokenModel>('tokens');
  }

  @override
  Future<void> saveToken(TokenModel tokenModel) async {
    var box = await hiveInterface.openBox<TokenModel>('tokens');
    box.get(tokenModel);
  }
}
