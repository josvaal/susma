import 'package:auto_route/auto_route.dart';
import 'package:susma/route_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: NavigationRoute.page,
        ),
      ];
}
