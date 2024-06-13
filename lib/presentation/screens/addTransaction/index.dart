import 'package:flutter/material.dart';
import 'package:simple_plan/presentation/components/transaction_form.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});
  static const addTransactionFormType = 1;

  @override
  Widget build(BuildContext context) {
    return const TransactionForm(
      screenTitle: "Nova Transação",
      formType: addTransactionFormType,
      initialTransactionEntity: null,
      monthKey: null,
    );
  }
}
