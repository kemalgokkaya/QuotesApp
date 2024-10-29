// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [QuotesPage]
class QuotesRoute extends PageRouteInfo<QuotesRouteArgs> {
  QuotesRoute({
    Key? key,
    required CategoryModel category,
    List<PageRouteInfo>? children,
  }) : super(
          QuotesRoute.name,
          args: QuotesRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'QuotesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuotesRouteArgs>();
      return QuotesPage(
        key: args.key,
        category: args.category,
      );
    },
  );
}

class QuotesRouteArgs {
  const QuotesRouteArgs({
    this.key,
    required this.category,
  });

  final Key? key;

  final CategoryModel category;

  @override
  String toString() {
    return 'QuotesRouteArgs{key: $key, category: $category}';
  }
}
