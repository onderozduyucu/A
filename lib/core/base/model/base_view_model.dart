import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/app_router.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/core/init/state/product_state_items.dart';

abstract class BaseViewModel {
  BuildContext? currentContext;
  VexanaManager? get vexanaManager => ProductStateItems.vexanaManager;
  LocaleManager get localeManager => ProductStateItems.localeManager;
  AppRouter get appRouter => ProductStateItems.appRouter;
  void setContext(BuildContext? context);
  void init();
}
