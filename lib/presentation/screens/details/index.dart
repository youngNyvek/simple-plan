import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/shared/enum/delete_type.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';
import 'package:simple_plan/domain/useCases/delete_transaction_use_case.dart';
import 'package:simple_plan/domain/useCases/toggle_done_value_use_case.dart';
import 'package:simple_plan/presentation/screens/editTransaction/index.dart';

class DetailScreen extends StatefulWidget {
  final TransactionEntryEntity transactionEntryEntity;
  final DateTime selectedDate;

  const DetailScreen(
      {super.key,
      required this.transactionEntryEntity,
      required this.selectedDate});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final deleteTransactionUseCase = DeleteTransactionUseCase();
  final toggleDoneValueUseCase = ToggleDoneValueUseCase();

  final f = DateFormat("dd/MM/yyyy");
  late String monthKey;
  late Color primaryColor = ThemeColors.green;
  late TransactionEntryEntity transactionEntryEntity;

  Future<void> deleteTransaction(int deleteType) async {
    try {
      await deleteTransactionUseCase.execute(
          monthKey, transactionEntryEntity.id!, deleteType);

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text("Registro deletado com sucesso!"),
            backgroundColor: ThemeColors.green,
          ),
        );

      Navigator.pop(context);
    } catch (err) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(err.toString()),
            backgroundColor: Colors.red,
          ),
        );
    }
  }

  void toggleDone() {
    setState(() {
      transactionEntryEntity.done = !transactionEntryEntity.done;
    });
  }

  void changeTransactionEntity(
      TransactionEntryEntity newTransactionEntryEntity) {
    setState(() {
      transactionEntryEntity = newTransactionEntryEntity;
    });
  }

  void handleDeleteTransaction() {
    if (transactionEntryEntity.recurrenceType == RecurrenceType.none.id) {
      deleteTransaction(DeleteType.ocurrence.id);
    } else {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          deleteTransaction(DeleteType.ocurrence.id);
                        },
                        child: const Text('Deletar ocorrência')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);

                          deleteTransaction(DeleteType.serie.id);
                        },
                        child: const Text('Deletar série'))
                  ],
                ));
          });
    }
  }

  Future<void> handleDoneTransaction() async {
    await toggleDoneValueUseCase.execute(monthKey, transactionEntryEntity.id!);
    toggleDone();
  }

  void handleEditTransaction() {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditTransaction(
                    transactionEntryEntity: transactionEntryEntity)))
        .then((newTransactionEntryEntity) {
      changeTransactionEntity(newTransactionEntryEntity);
    });
  }

  @override
  void initState() {
    super.initState();

    transactionEntryEntity = widget.transactionEntryEntity;
    monthKey = StringUtils.getMonthKey(widget.selectedDate);

    if (transactionEntryEntity.occurrenceType == OccurrenceType.income.id) {
      primaryColor = ThemeColors.green;
    } else {
      primaryColor = ThemeColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Detalhes da transação"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    StringUtils.formatCurrency(transactionEntryEntity.amount /
                        (transactionEntryEntity.installment ?? 1)),
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                      transactionEntryEntity.occurrenceType ==
                              OccurrenceType.expense.id
                          ? Icons.arrow_circle_down_rounded
                          : Icons.arrow_circle_up_rounded,
                      size: 28,
                      color: primaryColor)
                ],
              ),
              const SizedBox(height: 16),
              Text(
                transactionEntryEntity.installment != null
                    ? "${transactionEntryEntity.description} ${transactionEntryEntity.getCurrentInstallment(widget.selectedDate)}/${transactionEntryEntity.installment}"
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
                    style:
                        TextStyle(color: ThemeColors.whiteAlpha, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    f.format(
                        transactionEntryEntity.getDueDate(widget.selectedDate)),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "VENCIMENTO",
                    style:
                        TextStyle(color: ThemeColors.whiteAlpha, fontSize: 12),
                  )
                ],
              ),
            ],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: ThemeColors.red,
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        icon: const Icon(Icons.delete_forever),
                        onPressed: handleDeleteTransaction,
                      )),
                  Text(
                    "Deletar",
                    style: TextStyle(
                        color: ThemeColors.whiteAlpha, fontSize: 12, height: 3),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: ThemeColors.blue,
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: handleEditTransaction,
                      )),
                  Text(
                    "Editar",
                    style: TextStyle(
                        color: ThemeColors.whiteAlpha, fontSize: 12, height: 3),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: transactionEntryEntity.done
                              ? ThemeColors.red
                              : ThemeColors.green,
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        icon: Icon(transactionEntryEntity.done
                            ? Icons.close
                            : Icons.check_circle_sharp),
                        onPressed: handleDoneTransaction,
                      )),
                  Text(
                    transactionEntryEntity.done ? "Cancelar" : "Confirmar",
                    style: TextStyle(
                        color: ThemeColors.whiteAlpha, fontSize: 12, height: 3),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
