import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/models/fixed_transaction_entry_model.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entitie.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';

part 'dynamic_transaction_entry_model.g.dart';

const List<String> _defaultCategories = ["CUSTO FIXO", "LAZER", "SAÚDE"];

@Collection()
class DynamicTransactionEntryModel {
  Id id = Isar.autoIncrement;
  final String description;
  final double amount;
  final DateTime startDate;
  final int occurrenceType;
  final bool done;
  final DateTime? finishDate;
  final int? currentInstallment;
  final int? finalInstallment;
  final List<String> categories;
  final int recurrenceType;
  final int? transactionBaseId;
  late int? fixedTransactionId;

  DynamicTransactionEntryModel({
    required this.description,
    required this.amount,
    required this.startDate,
    required this.occurrenceType,
    required this.done,
    required this.categories,
    required this.recurrenceType,
    this.finishDate,
    this.currentInstallment,
    this.finalInstallment,
    this.transactionBaseId,
    this.fixedTransactionId,
  });

  DynamicTransactionEntryModel.fromEntity(TransactionEntryEntity entity)
      : description = entity.description,
        amount = entity.amount,
        startDate = entity.startDate,
        occurrenceType = entity.occurrenceType,
        done = entity.done,
        finishDate = entity.finishDate,
        currentInstallment = entity.currentInstallment,
        finalInstallment = entity.finalInstallment,
        categories = entity.categories,
        recurrenceType = entity.recurrenceType,
        transactionBaseId = entity.transactionBaseId,
        fixedTransactionId = entity.fixedTransactionId;

  FixedTransactionEntryModel toFixedEntry() {
    DateTime? finishDate;

    if (recurrenceType == RecurrenceType.installment.id) {
      finishDate = DateTime(
          startDate.year, startDate.month + finalInstallment!, startDate.day);
    }

    return FixedTransactionEntryModel(
        description: description,
        amount: amount,
        startDate: startDate,
        occurrenceType: occurrenceType,
        recurrenceType: recurrenceType,
        categories: categories,
        finishDate: finishDate);
  }

  @override
  String toString() {
    return 'DynamicTransactionEntryModel{id: $id, description: $description, amount: $amount, startDate: $startDate, occurrenceType: $occurrenceType, done: $done, finishDate: $finishDate, currentInstallment: $currentInstallment, finalInstallment: $finalInstallment, categories: $categories}';
  }
}
