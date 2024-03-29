import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/view/_mixin/login_view_mixin.dart';
import 'package:fluttermvvmtemplate/view/login/viewmodel/login_view_model.dart';
import 'package:gen/gen.dart';

@RoutePage()
final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _viewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _viewModel.scaffoldState,
        body: SafeArea(
          child: Column(
            children: [
              buildAnimatedContainer(context),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: context.paddingNormal,
                  child: buildForm(_viewModel, context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      color: Colors.white,
      child: Center(
        child: Assets.image.hotdogs.image(
          package: 'gen',
        ),
      ),
    );
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const Spacer(
            flex: 6,
          ),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          const Spacer(),
          buildTextForgot(),
          const Spacer(flex: 6),
          buildRaisedButtonLogin(context, value),
          buildWrapForgot(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(
    BuildContext context,
    LoginViewModel viewModel,
  ) {
    return Observer(
      builder: (_) {
        return TextFormField(
          controller: _passwordController,
          validator: (value) => value != null && value.isNotEmpty ? null : 'Check your email',
          obscureText: viewModel.isLockOpen,
          decoration: InputDecoration(
            labelStyle: context.textTheme.titleMedium,
            labelText: LocaleKeys.login_password.tr(),
            icon: buildContainerIconField(context, Icons.vpn_key),
            suffixIcon: TextButton(
              onPressed: () {
                viewModel.isLockStateChange();
              },
              child: Observer(
                builder: (_) {
                  return Icon(
                    viewModel.isLockOpen ? Icons.lock : Icons.lock_open,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  TextFormField buildTextFormFieldEmail(
    BuildContext context,
    LoginViewModel viewModel,
  ) {
    return TextFormField(
      controller: _emailController,
      validator: (value) => value?.isValidEmail,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
        labelStyle: context.textTheme.titleMedium,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.colors.background),
    );
  }

  Widget buildTextForgot() => Align(
        alignment: Alignment.centerRight,
        child: const Text(LocaleKeys.login_forgotText, textAlign: TextAlign.end).tr(),
      );

  Widget buildRaisedButtonLogin(
    BuildContext context,
    LoginViewModel viewModel,
  ) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: context.paddingNormal,
          child: ElevatedButton(
            onPressed: viewModel.isLoading
                ? null
                : () async {
                    await viewModel.fetchLoginService(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.onError,
              shape: const StadiumBorder(),
            ),
            child: Center(
              child: Text(
                LocaleKeys.login_login.tr(),
                style: context.textTheme.headlineSmall,
              ),
            ),
            //color: context.colors.onError,
          ),
        );
      },
    );
  }

  Wrap buildWrapForgot() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(LocaleKeys.login_dontAccount.tr()),
        TextButton(onPressed: () {}, child: Text(LocaleKeys.login_tab2.tr())),
      ],
    );
  }
}
