import 'package:injectable/injectable.dart';

abstract class AuthLocalDatasource {
  Future<void> checkAuthenticateUser();
}

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  @override
  Future<void> checkAuthenticateUser() async {
    return;
  }
}
