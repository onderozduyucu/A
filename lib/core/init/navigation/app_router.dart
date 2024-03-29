import 'package:auto_route/auto_route.dart';
import 'package:fluttermvvmtemplate/view/home/view/home_view.dart';
import 'package:fluttermvvmtemplate/view/login/view/login_view.dart';
import 'package:fluttermvvmtemplate/view/onboard/view/on_board_view.dart';
import 'package:fluttermvvmtemplate/view/splash/view/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

/// Project router information class
final class AppRouter extends _$AppRouter {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SplashRoute.page, initial: true ),
        AutoRoute(page: OnBoardRoute.page,  ),
      ];
}
