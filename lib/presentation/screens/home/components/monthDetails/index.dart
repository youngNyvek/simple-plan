import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';
import 'package:simple_plan/presentation/screens/home/components/monthDetails/occurrence_details.dart';

class MonthDetail extends StatelessWidget {
  final double currentExpenses;
  final double expenses;
  final double currentIncomes;
  final double incomes;

  const MonthDetail(
      {super.key,
      required this.currentExpenses,
      required this.expenses,
      required this.currentIncomes,
      required this.incomes});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ThemeColors.darkGray,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OccurrenceDetails(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    currentValue: currentExpenses,
                    expectedValue: expenses,
                    icon: Icons.trending_down,
                    label: "DESPESAS",
                    primaryColor: ThemeColors.red),
                OccurrenceDetails(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    currentValue: currentIncomes - currentExpenses,
                    expectedValue: incomes - expenses,
                    icon: Icons.trending_flat,
                    label: "SALDO",
                    primaryColor: ThemeColors.blue),
                OccurrenceDetails(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    currentValue: currentIncomes,
                    expectedValue: incomes,
                    icon: Icons.trending_up,
                    label: "RECEITAS",
                    primaryColor: ThemeColors.green),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mais detalhes",
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
                Icon(
                  Icons.expand_more,
                  color: Colors.white.withOpacity(0.5),
                )
              ],
            )
          ],
        ));
  }
}
