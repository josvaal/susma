import 'package:auto_route/auto_route.dart';
import 'package:susma/route_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        RedirectRoute(path: '/', redirectTo: '/auth'),
        AutoRoute(
          path: "/home",
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: "/auth",
          page: AuthRoute.page,
        ),
      ];
}
