import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/app_router.dart';

/// Manage your network error with screen
final class NetworkErrorManager {
  NetworkErrorManager(this.context);
  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.unauthorized) {
    //  if (value == 401) {}
      context.router.push(const LoginRoute());
    }
  }
}
