import 'package:flutter/material.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/amount_row.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/categories_row.dart';

class TransactionCard extends StatelessWidget {
  final int occurrenceType;
  final List<String> categories;
  final String description;
  final double amount;
  final int? currentInstallment;
  final int? finalInstallment;

  const TransactionCard(
      {super.key,
      required this.occurrenceType,
      required this.categories,
      required this.description,
      required this.amount,
      this.currentInstallment,
      this.finalInstallment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(children: [
        Icon(
          occurrenceType == OccurrenceType.expense.id
              ? Icons.arrow_circle_down_rounded
              : Icons.arrow_circle_up_rounded,
          size: 26,
          color: occurrenceType == OccurrenceType.expense.id
              ? ThemeColors.red
              : ThemeColors.green,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoriesRow(categories: categories),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                AmountRow(
                    amount: amount,
                    currentInstallment: currentInstallment,
                    finalInstallment: finalInstallment)
              ],
            ))
      ]),
    );
  }
}
