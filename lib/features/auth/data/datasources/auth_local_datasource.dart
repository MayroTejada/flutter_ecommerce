import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/data/models/user_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDatasource {
  Future<TokenModel?> getToken();
  Future<void> saveToken(TokenModel tokenModel);
  Future<UserModel> signUpUser(String email, String password, String username);
}

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final HiveInterface hiveInterface;

  AuthLocalDatasourceImpl({required this.hiveInterface});
  @override
  Future<TokenModel?> getToken() async {
    final box = await hiveInterface.openBox<TokenModel>('tokens');
    if (box.values.isNotEmpty) {
      return box.values.first;
    } else {
      return null;
    }
  }

  @override
  Future<void> saveToken(TokenModel tokenModel) async {
    var box = await hiveInterface.openBox<TokenModel>('tokens');
    box.add(tokenModel);
  }

  @override
  Future<UserModel> signUpUser(
      String email, String password, String username) async {
    var box = await hiveInterface.openBox<UserModel>('users');
    box.add(UserModel(
      id: UniqueKey().toString(),
      email: email,
      username: username,
      password: password,
    ));
    return box.values.last;
  }
}
