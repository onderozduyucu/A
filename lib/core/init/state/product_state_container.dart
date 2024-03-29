import 'package:fluttermvvmtemplate/core/init/cache/auth_manager.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/app_router.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:get_it/get_it.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;



  /// Product core required items
  static void setup() {
    _getIt
      ..registerSingleton<VexanaManager>(VexanaManager.base())
      ..registerSingleton<LocaleManager>(LocaleManager())
      ..registerSingleton<AppRouter>(AppRouter())
      ..registerLazySingleton<AuthenticationManager>(
        AuthenticationManager.new,
      );
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
