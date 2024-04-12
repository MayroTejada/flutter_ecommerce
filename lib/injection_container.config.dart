// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/auth/data/datasources/auth_datasource_implementation.dart'
    as _i3;
import 'features/auth/data/repositories/auth_repository_implementation.dart'
    as _i5;
import 'features/auth/domain/repositories/auth_repository.dart' as _i4;
import 'features/auth/domain/usecases/authenticate_user.dart' as _i6;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthDatasource>(() => _i3.AuthDatasourceImpl());
    gh.factory<_i4.AuthRepository>(
        () => _i5.AuthRepositoryImpl(datasource: gh<_i3.AuthDatasource>()));
    gh.factory<_i6.AuthenticateUser>(
        () => _i6.AuthenticateUser(repository: gh<_i4.AuthRepository>()));
    gh.factory<_i7.AuthBloc>(
        () => _i7.AuthBloc(authenticateUser: gh<_i6.AuthenticateUser>()));
    return this;
  }
}
