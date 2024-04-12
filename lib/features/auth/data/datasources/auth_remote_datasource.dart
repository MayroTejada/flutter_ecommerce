import 'package:injectable/injectable.dart';

abstract class AuthDatasource {
  Future<void> checkAuthenticateUser();
}

@Injectable(as: AuthDatasource)
class AuthDatasourceImpl implements AuthDatasource {
  AuthDatasourceImpl();

  @override
  Future<void> checkAuthenticateUser() async {}
}
