import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/splash/view_model/splash_view_model.dart';
import 'package:gen/gen.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _viewModel = SplashViewModel();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {  _viewModel.controlToApp(); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _viewModel.scaffoldState,
      body: Center(
        child: Stack(
          children: [
            const SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                backgroundColor: Colors.amber,
                color: Colors.blue,
              ),
            ),
            Assets.image.google70.image(
              package: 'gen',
            ),
          ],
        ),
      ),
    );
  }
}
