import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    _startDelay(context);
  }

  Future<void> _startDelay(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (context.mounted) {
      context.router.push(HomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: const Text(
                  "Özlü Sözler",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 80),
                padding: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.transparent,
                height: 200,
                width: double.infinity,
                child: const Text(
                  "En Doğru Yerdesin",
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
