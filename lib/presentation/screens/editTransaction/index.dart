import 'package:flutter/material.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/presentation/components/transaction_form.dart';

class EditTransaction extends StatelessWidget {
  final TransactionEntryEntity transactionEntryEntity;

  const EditTransaction({super.key, required this.transactionEntryEntity});
  static const formType = 2;

  @override
  Widget build(BuildContext context) {
    return TransactionForm(
      screenTitle: "Editar Transação",
      formType: formType,
      initialTransactionEntity: transactionEntryEntity,
    );
  }
}
