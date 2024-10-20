import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true, path: "/"),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: QuotesRoute.page),
      ];
}
