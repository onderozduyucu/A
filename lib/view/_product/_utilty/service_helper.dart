import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

mixin class ServiceHelper {
  void showMessage(
    GlobalKey<ScaffoldState> scaffoldKey,
    BuildContext context,
    IErrorModel? errorModel,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text(errorModel?.description ?? errorModel!.statusCode.toString()),
      ),
    );
  }
}
