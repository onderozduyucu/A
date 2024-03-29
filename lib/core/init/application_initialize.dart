// ignore_for_file: flutter_style_todos

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermvvmtemplate/core/init/config/app_environment.dart';
import 'package:fluttermvvmtemplate/core/init/state/product_state_container.dart';
import 'package:fluttermvvmtemplate/core/init/state/product_state_items.dart';

import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable

/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // TODO: Splash
    await DeviceUtility.instance.initPackageInfo();
    //for kartal
    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      /// Todo: add custom logger
      Logger().e(details.exceptionAsString());
    };
    //do not change this method
    AppEnvironment.general();
    ProductContainer.setup();
    ProductStateItems.appRouter;
    await ProductStateItems.localeManager.init();
    // Depedency initialize
    // envied
  }
}
