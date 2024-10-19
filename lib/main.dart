import 'package:flutter/material.dart';

import 'package:quotes/quotes.dart';

final appRouter = AppRouter();
void main() {
  runApp(
    const ProviderScope(
      child: SplashPage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return GestureDetector(
          child: child,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        );
      },
    );
  }
}
