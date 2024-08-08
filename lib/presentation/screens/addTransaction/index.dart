import 'package:flutter/material.dart';
import 'package:simple_plan/presentation/components/transaction_form.dart';

class AddTransaction extends StatelessWidget {
  final String? monthKey;

  const AddTransaction({super.key, this.monthKey});

  static const addTransactionFormType = 1;

  @override
  Widget build(BuildContext context) {
    return TransactionForm(
      screenTitle: "Nova Transação",
      formType: addTransactionFormType,
      initialTransactionEntity: null,
      monthKey: monthKey,
    );
  }
}
