import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            child: const Text(
              "Simple Plan",
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }
}
