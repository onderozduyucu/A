import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/cache/auth_manager.dart';
import 'package:fluttermvvmtemplate/view/login/model/user.dart';

import 'package:provider/provider.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late User? model;
  @override
  void initState() {
    super.initState();
    model = context.read<AuthenticationManager>().model;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${model?.name}'),
      ),
      body: CircleAvatar(backgroundImage: NetworkImage(model?.imageUrl ?? '')),
    );
  }
}
