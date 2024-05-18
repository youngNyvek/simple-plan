import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entitie.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';

const List<String> categoryList = <String>[
  'Custo Fixo',
  'Lazer',
];

class DetailScreen extends StatelessWidget {
  final TransactionEntryEntity transactionEntryEntity;
  final DateTime selectedDate;
  final f = DateFormat("dd/MM/yyyy");

  late Color primaryColor;

  DetailScreen(
      {super.key,
      required this.transactionEntryEntity,
      required this.selectedDate}) {
    if (transactionEntryEntity.occurrenceType == OccurrenceType.income.id) {
      primaryColor = ThemeColors.green;
    } else {
      primaryColor = ThemeColors.red;
    }
  }

  static const detailScreenFormType = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Detalhes da transação"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: transactionEntryEntity.categories
                  .map((item) => Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: primaryColor),
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        margin: const EdgeInsets.all(4),
                        child: Text(
                          item.toUpperCase(),
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringUtils.formatCurrency(transactionEntryEntity.amount),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(width: 8),
                Icon(Icons.arrow_circle_down_rounded,
                    size: 28, color: primaryColor)
              ],
            ),
            const SizedBox(height: 16),
            Text(
              transactionEntryEntity.installment != null
                  ? "${transactionEntryEntity.description} ${transactionEntryEntity.getCurrentInstallment(selectedDate)}/${transactionEntryEntity.installment}"
                  : transactionEntryEntity.description,
              style: TextStyle(color: primaryColor, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  RecurrenceType.getRecurrenceById(
                          transactionEntryEntity.recurrenceType)
                      .description,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "RECORRÊNCIA",
                  style: TextStyle(color: ThemeColors.whiteAlpha, fontSize: 12),
                )
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  f.format(transactionEntryEntity.getDueDate(selectedDate)),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "VENCIMENTO",
                  style: TextStyle(color: ThemeColors.whiteAlpha, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
