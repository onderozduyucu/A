import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/init/network/network_error_manager.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';



/// Manage your home view business logic
mixin ErrorMixin<T extends StatefulWidget> on State<T>{
  late final VexanaManager vexanaNetworkManager;
  late final NetworkErrorManager networkErrorManager;
  @override
  void initState() {
    super.initState();
    vexanaNetworkManager = VexanaManager.base();
    networkErrorManager = NetworkErrorManager(context);
    vexanaNetworkManager.listenErrorState(
    onErrorStatus: networkErrorManager.handleError,
    );
  }


  
}
