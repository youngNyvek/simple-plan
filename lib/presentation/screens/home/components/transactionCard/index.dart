import 'package:flutter/material.dart';
import 'package:simple_plan/domain/enums/occurence_type.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';
import 'package:simple_plan/presentation/constants/theme_icons.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/amount_row.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/categories_row.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/done_flag.dart';

class TransactionCard extends StatelessWidget {
  final int occurrenceType;
  final List<String> categories;
  final String description;
  final double amount;
  final int? currentInstallment;
  final int? installment;
  final bool done;

  const TransactionCard(
      {super.key,
      required this.occurrenceType,
      required this.categories,
      required this.description,
      required this.amount,
      this.currentInstallment,
      this.installment,
      required this.done});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(children: [
        Icon(
          occurrenceType == OccurrenceType.expense.id
              ? ThemeIcons.expense
              : ThemeIcons.income,
          size: 24,
          color: occurrenceType == OccurrenceType.expense.id
              ? ThemeColors.red
              : ThemeColors.green,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoriesRow(categories: categories),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        description,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      DoneFlag(done: done, occurenceType: occurrenceType)
                    ]),
                AmountRow(
                    amount: amount / (installment ?? 1),
                    currentInstallment: currentInstallment,
                    finalInstallment: installment)
              ],
            ))
      ]),
    );
  }
}
