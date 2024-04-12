// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i6;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'features/auth/data/datasources/auth_local_datasource.dart' as _i5;
import 'features/auth/data/datasources/auth_remote_datasource.dart' as _i7;
import 'features/auth/data/repositories/auth_repository_implementation.dart'
    as _i9;
import 'features/auth/data/services/auth_service.dart' as _i4;
import 'features/auth/domain/repositories/auth_repository.dart' as _i8;
import 'features/auth/domain/usecases/check_auth_user.dart' as _i11;
import 'features/auth/domain/usecases/save_token.dart' as _i10;
import 'features/auth/domain/usecases/sign_up_user.dart' as _i12;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i13;
import 'injection_container.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.HiveInterface>(
      () => registerModule.hive,
      preResolve: true,
    );
    gh.factory<_i4.FalseAuthService>(() => _i4.FalseAuthServiceImpl());
    gh.factory<_i5.AuthLocalDatasource>(() =>
        _i5.AuthLocalDatasourceImpl(hiveInterface: gh<_i6.HiveInterface>()));
    gh.factory<_i7.AuthDatasource>(() =>
        _i7.AuthDatasourceImpl(falseAuthService: gh<_i4.FalseAuthService>()));
    gh.factory<_i8.AuthRepository>(() => _i9.AuthRepositoryImpl(
          remoteDataSource: gh<_i7.AuthDatasource>(),
          localDatasource: gh<_i5.AuthLocalDatasource>(),
        ));
    gh.factory<_i10.SaveToken>(
        () => _i10.SaveToken(repository: gh<_i8.AuthRepository>()));
    gh.factory<_i11.CheckAuthUser>(
        () => _i11.CheckAuthUser(repository: gh<_i8.AuthRepository>()));
    gh.factory<_i12.SignUpUser>(
        () => _i12.SignUpUser(repository: gh<_i8.AuthRepository>()));
    gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(
          checkAuthUser: gh<_i11.CheckAuthUser>(),
          saveToken: gh<_i10.SaveToken>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
