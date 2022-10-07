import 'package:flutter/material.dart';
import 'package:simple_plan/screens/home/components/card_item.dart';
import 'package:simple_plan/screens/home/components/expandable_fab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _floatingButtonIsOpened = false;

  void changeFloatingState() {
    setState(() {
      _floatingButtonIsOpened = !_floatingButtonIsOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
          Image.asset(
            "assets/images/simplePlan_logo_text.png",
            width: 128,
            height: 200,
          ),
          plansList()
        ])),
        floatingActionButton: const ExpandableFab());
  }

  Widget plansList() {
    return Expanded(
        flex: 1,
        child: ListView(padding: EdgeInsets.zero, children: const [
          CardItem(
            marginTop: 3,
            initial: 2,
            balance: 2,
            income: 2,
            expenses: 2,
          ),
          SizedBox(height: 30),
          CardItem(marginTop: 3, initial: 2, balance: 2, income: 2, expenses: 2)
        ]));
  }
}
