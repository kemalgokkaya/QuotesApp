import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, path: "/"),
        AutoRoute(page: QuotesRoute.page),
      ];
}
