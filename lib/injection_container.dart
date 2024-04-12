import 'package:flutter_ecommerce/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @preResolve
  Future<HiveInterface> get hive async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.initFlutter(appDocumentDir.path);
    return Hive;
  }
}

//Dependency injection
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
