import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/init/cache/auth_manager.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/app_router.dart';
import 'package:fluttermvvmtemplate/view/login/model/user.dart';

import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase extends BaseViewModel with Store {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late final User user;
  @override
  void init() {}
  @override
  void setContext(BuildContext? context) => currentContext = scaffoldState.currentContext;

  Future<void> controlToApp() async {
    setContext(scaffoldState.currentContext);
    await _safeOperation(() async {
      await authReadManager.fetchUserLogin();
    });

    await _safeOperation(() async {
      if (authReadManager.isFirst == false) {
        await appRouter.push(const OnBoardRoute());
      } else if (authReadManager.isLogin) {
        await Future<void>.delayed(const Duration(seconds: 2));
        await _safeOperation(() async {
          authReadManager.model = User.fake();
          await appRouter.replace(const HomeRoute());
        });
        await appRouter.replace(const LoginRoute());
      }
    });
  }

  Future<void> _safeOperation(AsyncCallback callback) async {
    if (currentContext == null) {
      return;
    } else if (!currentContext!.mounted) {
      return;
    }
    await callback.call();
  }

  AuthenticationManager get authReadManager => currentContext!.read<AuthenticationManager>();
}
