import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Quotes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.blueAccent,
      ),
    );
  }
}
