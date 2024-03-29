import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/config/app_environment.dart';
import 'package:vexana/vexana.dart';

/// Product network manager
final class VexanaManager extends NetworkManager<EmptyModel> {
  VexanaManager.base()
      : super(
          isEnableLogger: true,
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
          ),
        );

  /// Handle error
  /// [onErrorStatus] is error status code [HttStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}
