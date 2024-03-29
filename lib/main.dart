import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/application_initialize.dart';
import 'package:fluttermvvmtemplate/core/init/cache/auth_manager.dart';
import 'package:fluttermvvmtemplate/core/init/lang/language_manager.dart';
import 'package:fluttermvvmtemplate/core/init/state/product_state_items.dart';
import 'package:fluttermvvmtemplate/core/init/theme/custom_dark_theme.dart';
import 'package:fluttermvvmtemplate/core/init/theme/custom_light_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationManager>(
          create: (context) => ProductStateItems.authenticationManager,
        ),
      ],
      child: LanguageManager(child: const _MyApp()),
    ),
  );
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = ProductStateItems.appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
