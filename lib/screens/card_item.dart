import 'package:flutter/material.dart';
import 'package:simple_plan/utils/theme_colors.dart';
import 'package:intl/intl.dart';

class CardItem extends StatelessWidget {
  final double initial;
  final double balance;
  final double income;
  final double expenses;
  final double marginTop;

  const CardItem(
      {super.key,
      required this.marginTop,
      required this.initial,
      required this.balance,
      required this.income,
      required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 64,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width / 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatCurrency(initial),
                      style: const TextStyle(color: ThemeColors.darkGray),
                    ),
                    const Text(
                      "Inicial",
                      style: TextStyle(
                          color: ThemeColors.pink, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatCurrency(balance),
                      style: const TextStyle(color: ThemeColors.darkGray),
                    ),
                    const Text(
                      "Saldo",
                      style: TextStyle(
                          color: ThemeColors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatCurrency(income),
                      style: const TextStyle(color: ThemeColors.darkGray),
                    ),
                    const Text(
                      "Renda",
                      style: TextStyle(
                          color: ThemeColors.green,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatCurrency(expenses),
                      style: const TextStyle(color: ThemeColors.darkGray),
                    ),
                    const Text(
                      "Despesas",
                      style: TextStyle(
                          color: ThemeColors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )),
        Positioned(
            top: -10,
            left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ThemeColors.blue,
              ),
              child: const Text(
                "Mar.2020",
                style: TextStyle(
                    color: ThemeColors.white, fontWeight: FontWeight.bold),
              ),
            )),
      ],
    ));
  }

  String _formatCurrency(double n) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
        .format(n);
  }
}
