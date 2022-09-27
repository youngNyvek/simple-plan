import 'package:flutter/material.dart';
import 'package:simple_plan/screens/card_item.dart';
import 'package:simple_plan/utils/theme_Colors.dart';

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
          Expanded(
              flex: 1,
              child: ListView(children: [
                const CardItem(
                  marginTop: 3,
                  initial: 2,
                  balance: 2,
                  income: 2,
                  expenses: 2,
                ),
                const SizedBox(height: 30),
                const CardItem(
                  marginTop: 3,
                  initial: 2,
                  balance: 2,
                  income: 2,
                  expenses: 2,
                ),
                Center(
                  child: Text(
                    "$_floatingButtonIsOpened",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ]))
        ])),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    width: _floatingButtonIsOpened ? 180 : 0,
                    child: FloatingActionButton.extended(
                      onPressed: () => {},
                      backgroundColor: ThemeColors.pink,
                      label: _floatingButtonIsOpened
                          ? const Text("Nova categoria")
                          : const Text(""),
                      icon: _floatingButtonIsOpened
                          ? const Icon(Icons.category, size: 30)
                          : null,
                    )),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () => changeFloatingState(),
                  backgroundColor: ThemeColors.blue,
                  child: Transform.rotate(
                      angle: _floatingButtonIsOpened ? 40 : 0,
                      child: const Icon(Icons.add, size: 30)),
                ),
              ],
            )));
  }
}
