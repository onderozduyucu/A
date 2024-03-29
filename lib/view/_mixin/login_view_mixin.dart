import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/app_router.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_error_manager.dart';
import 'package:fluttermvvmtemplate/core/init/state/product_state_items.dart';
import 'package:fluttermvvmtemplate/view/login/view/login_view.dart';

/// Manage your home view business logic
mixin LoginViewMixin on State<LoginView> {
  late final NetworkErrorManager networkErrorManager;
  final snackBar = const SnackBar(
    duration: Duration(seconds: 5),
    content: Text('Login Failed'),
    backgroundColor: Colors.red,
  );
  @override
  void initState() {
    super.initState();
    networkErrorManager = NetworkErrorManager(context);
    ProductStateItems.vexanaManager.listenErrorState(
      onErrorStatus: (value) {
        if (value == HttpStatus.unauthorized) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          context.router.push(const LoginRoute());
        }
      },
    );
  }
}
