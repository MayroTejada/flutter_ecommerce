import 'package:flutter_ecommerce/features/auth/data/models/token_model.dart';
import 'package:flutter_ecommerce/features/auth/domain/entities/token.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class AuthHiveService {
  Future<TokenModel> getToken();
  Future<void> saveToken(TokenModel token);
}

@Injectable(as: AuthHiveService)
class AuthHiveServiceImpl implements AuthHiveService {
  @override
  Future<TokenModel> getToken() async {
    final box = await Hive.openBox<TokenModel>('token');
    return box.values.first;
  }

  @override
  Future<void> saveToken(TokenModel token) async {
    var box = await Hive.openBox<TokenModel>('token');
    await box.add(token);
    return;
  }
}
