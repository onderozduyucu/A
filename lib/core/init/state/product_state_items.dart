

import 'package:fluttermvvmtemplate/core/init/cache/auth_manager.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/app_router.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/core/init/state/product_state_container.dart';

final class ProductStateItems {
  const ProductStateItems._();
  static VexanaManager get vexanaManager => ProductContainer.read<VexanaManager>();
  static LocaleManager get localeManager => ProductContainer.read<LocaleManager>();
  static AppRouter get appRouter => ProductContainer.read<AppRouter>();
  static AuthenticationManager get authenticationManager => ProductContainer.read<AuthenticationManager>();
     
}

