import 'package:flutter/material.dart';
import 'package:simple_plan/screens/home/components/card_item.dart';
import 'package:simple_plan/screens/home/components/expandable_fab.dart';
import 'package:simple_plan/shared/utils/theme_colors.dart';
import 'package:simple_plan/shared/utils/string_utils.dart';

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
            height: 120,
          ),
          selectedMonth(),
          principalData()
        ])),
        floatingActionButton: const ExpandableFab());
  }

  Widget selectedMonth() {
    return const Padding(
        padding: EdgeInsets.all(16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Text(
              "<",
              style: TextStyle(color: ThemeColors.white, fontSize: 16),
            )
          ]),
          Row(
            children: [
              Text(
                "Março | ",
                style: TextStyle(
                    color: ThemeColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "2023",
                style: TextStyle(color: ThemeColors.white, fontSize: 14),
              )
            ],
          ),
          Column(
            children: [
              Text(
                ">",
                style: TextStyle(color: ThemeColors.white, fontSize: 16),
              )
            ],
          )
        ]));
  }

  Widget principalData() {
    return Container(
        height: 116,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ThemeColors.darkGray,
        ),
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringUtils.formatCurrency(3000),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const Text(
                      "Saldo Total",
                      style: TextStyle(
                          color: ThemeColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringUtils.formatCurrency(3000),
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, height: 0.5),
                    ),
                    const Text(
                      "Despesas",
                      style: TextStyle(
                          color: ThemeColors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringUtils.formatCurrency(3000),
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, height: 0.5),
                    ),
                    const Text(
                      "Receitas",
                      style: TextStyle(
                          color: ThemeColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ],
            )
          ],
        ));
  }

  // Widget plansList() {
  //   return Expanded(
  //       flex: 1,
  //       child: ListView(padding: EdgeInsets.zero, children: const [
  //         CardItem(
  //           marginTop: 3,
  //           initial: 2,
  //           balance: 2,
  //           income: 2,
  //           expenses: 2,
  //         ),
  //         SizedBox(height: 30),
  //         CardItem(marginTop: 3, initial: 2, balance: 2, income: 2, expenses: 2)
  //       ]));
  // }
}
