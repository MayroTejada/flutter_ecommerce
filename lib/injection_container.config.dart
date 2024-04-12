// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/auth/data/datasources/auth_local_datasource.dart' as _i4;
import 'features/auth/data/datasources/auth_remote_datasource.dart' as _i3;
import 'features/auth/data/repositories/auth_repository_implementation.dart'
    as _i6;
import 'features/auth/domain/repositories/auth_repository.dart' as _i5;
import 'features/auth/domain/usecases/check_auth_user.dart' as _i7;
import 'features/auth/domain/usecases/save_token.dart' as _i8;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i9;

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
    gh.factory<_i4.AuthLocalDatasource>(() => _i4.AuthLocalDatasourceImpl());
    gh.factory<_i5.AuthRepository>(() => _i6.AuthRepositoryImpl(
          datasource: gh<_i3.AuthDatasource>(),
          localDatasource: gh<_i4.AuthLocalDatasource>(),
        ));
    gh.factory<_i7.CheckAuthUser>(
        () => _i7.CheckAuthUser(repository: gh<_i5.AuthRepository>()));
    gh.factory<_i8.SaveToken>(
        () => _i8.SaveToken(repository: gh<_i5.AuthRepository>()));
    gh.factory<_i9.AuthBloc>(
        () => _i9.AuthBloc(checkAuthUser: gh<_i7.CheckAuthUser>()));
    return this;
  }
}
