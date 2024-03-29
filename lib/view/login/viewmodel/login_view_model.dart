import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/locale_keys_enum.dart';
import 'package:fluttermvvmtemplate/core/init/cache/auth_manager.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/app_router.dart';
import 'package:fluttermvvmtemplate/core/init/state/product_state_items.dart';
import 'package:fluttermvvmtemplate/view/login/model/login_request_model.dart';
import 'package:fluttermvvmtemplate/view/login/model/user.dart';
import 'package:fluttermvvmtemplate/view/login/service/login_service.dart';

import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel with Store {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  LoginService loginService = LoginService(ProductStateItems.vexanaManager);

  @override
  void setContext(BuildContext? context) => currentContext = scaffoldState.currentContext;
  @override
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  Future<void> fetchLoginService({required String email, required String password}) async {
    isLoadingChange();
    setContext(scaffoldState.currentContext);
    if (formState.currentState?.validate() != null) {
      final response = await loginService.fetchUserControl(
        LoginRequestModel(
          email: email,
          password: password,
        ),
      );

      if (response != null) {
        await localeManager.saveToken(
          PreferencesKeys.TOKEN,
          response.access_token.toString(),
        );

        currentContext?.read<AuthenticationManager>().model = User.fake();
        await appRouter.replace(const HomeRoute());
      } else {
        await appRouter.replace(const LoginRoute());
      }
    }
    isLoadingChange();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
