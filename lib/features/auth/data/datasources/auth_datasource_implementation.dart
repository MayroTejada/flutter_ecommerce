import 'package:injectable/injectable.dart';

abstract class AuthDatasource {
  Future<void> authenticateUser();
}

@Injectable(as: AuthDatasource)
class AuthDatasourceImpl implements AuthDatasource {
  AuthDatasourceImpl();

  @override
  Future<void> authenticateUser() {
    // TODO: implement authenticateUser
    throw UnimplementedError();
  }
}
