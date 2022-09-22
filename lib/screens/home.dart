import 'package:flutter/material.dart';
import 'package:simple_plan/screens/card_item.dart';
import 'package:simple_plan/utils/theme_Colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> teste = List.generate(2, (index) => "3");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Image.asset(
            "assets/images/simplePlan_logo_text.png",
            width: 128,
            height: 200,
          ),
          Expanded(
              flex: 1,
              child: ListView(
                children: const [
                  CardItem(
                    initial: 2,
                    balance: 2,
                    income: 2,
                    expenses: 2,
                  ),
                  CardItem(
                    initial: 2,
                    balance: 2,
                    income: 2,
                    expenses: 2,
                  ),
                  CardItem(
                    initial: 2,
                    balance: 2,
                    income: 2,
                    expenses: 2,
                  )
                ],
              ))
        ],
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () => {},
          backgroundColor: ThemeColors.blue,
          child: const Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
