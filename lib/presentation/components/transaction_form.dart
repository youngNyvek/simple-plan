import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/enums/delete_type.dart';
import 'package:simple_plan/domain/enums/occurence_type.dart';
import 'package:simple_plan/domain/enums/recurrence_type.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';
import 'package:simple_plan/domain/useCases/delete_transaction_use_case.dart';
import 'package:simple_plan/domain/useCases/insert_transaction_entry_use_case.dart';

const List<String> categoryList = <String>[
  'Custo Fixo',
  'Conforto',
  'Metas',
  'Prazeres',
  'Conhecimento',
  'Liberdade Finânceira'
];

const requiredField = "Obrigatório";

class TransactionForm extends StatefulWidget {
  final String screenTitle;
  final int formType;
  final TransactionEntryEntity? initialTransactionEntity;
  final String? monthKey;

  const TransactionForm(
      {super.key,
      required this.screenTitle,
      required this.formType,
      required this.initialTransactionEntity,
      required this.monthKey});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final formatadorData = DateFormat("dd/MM/yyyy");
  final insertTransactionUseCase = InsertOrUpdateTransactionEntryUseCase();
  final deleteTransactionUseCase = DeleteTransactionUseCase();
  final recurrenceList = RecurrenceType.recurrenceList;
  final formatadorDecimal = NumberFormat("#,##0.00", "pt_BR");

  TextEditingController dateController = TextEditingController();

  DateTime currentDate = DateTime.now();

  late int? occurenceType;
  late String amount;
  late String description;
  late int recurrenceValue;
  late String categoryValue;
  late int installmentValue;
  late Color primaryColor;
  late double installmentAmount;

  void setInstallmentAmount() {
    installmentAmount = convertStringToDouble(amount) / installmentValue;
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.initialTransactionEntity != null
            ? widget.initialTransactionEntity!.dueDate
            : currentDate,
        firstDate: DateTime(currentDate.year - 10),
        lastDate: DateTime(currentDate.year + 10));

    if (picked != null) {
      setState(() => dateController.text = formatadorData.format(picked));
    }
  }

  void updateDescription(String value) {
    setState(() {
      description = value;
    });
  }

  void updateAmount(value) {
    setState(() {
      amount = value;
      if (recurrenceValue == RecurrenceType.installment.id) {
        setInstallmentAmount();
      }
    });
  }

  void incrementInstallment() {
    setState(() {
      installmentValue++;
      setInstallmentAmount();
    });
  }

  void decrementInstallment() {
    setState(() {
      if (installmentValue > 2) {
        installmentValue--;
        installmentAmount = convertStringToDouble(amount) / installmentValue;
      }
    });
  }

  void handleChangeRecurrenceType(String? value) {
    setState(() {
      recurrenceValue = RecurrenceType.getRecurrenceByDesc(value!).id;
      setInstallmentAmount();
    });
  }

  void updateOccurrenceType(int? value) {
    setState(() {
      occurenceType = value;

      if (widget.formType == 1) {
        if (value == OccurrenceType.income.id) {
          primaryColor = ThemeColors.green;
        } else if (value == OccurrenceType.expense.id) {
          primaryColor = ThemeColors.red;
        }
      }
    });
  }

  double convertStringToDouble(String value) {
    return double.parse(value.replaceAll('.', '').replaceAll(',', '.'));
  }

  void handleEditOcurrence() {
    setState(() {
      recurrenceValue = RecurrenceType.none.id;
    });
    submitForm(null);
    deleteTransactionUseCase.execute(widget.monthKey!,
        widget.initialTransactionEntity!.id!, DeleteType.ocurrence.id);
    Navigator.pop(context);
  }

  void handleSubmitForm() async {
    if (widget.formType == 2 &&
        widget.initialTransactionEntity!.recurrenceType ==
            RecurrenceType.every.id) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: handleEditOcurrence,
                        child: const Text('Editar ocorrência')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          submitForm(widget.initialTransactionEntity!.id);
                        },
                        child: const Text('Editar série'))
                  ],
                ));
          });
    } else {
      submitForm(widget.initialTransactionEntity?.id);
    }
  }

  Future<void> submitForm(int? transactionId) async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Processando...')),
        );

      var dateSplitted = dateController.text.split("/");
      var transactionEntity = TransactionEntryEntity(
          id: transactionId,
          done: false,
          dueDate: DateTime(int.parse(dateSplitted[2]),
              int.parse(dateSplitted[1]), int.parse(dateSplitted[0])),
          description: description,
          amount: convertStringToDouble(amount),
          occurrenceType: occurenceType!,
          recurrenceType: recurrenceValue,
          installment: recurrenceValue == RecurrenceType.installment.id
              ? installmentValue
              : null,
          categories: [categoryValue]);

      try {
        await insertTransactionUseCase.execute(transactionEntity);

        if (!mounted) return;

        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text("Registro inserido com sucecsso!"),
              backgroundColor: ThemeColors.green,
            ),
          );

        Navigator.pop(context, transactionEntity);
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
  }

  _TransactionFormState() {
    dateController.text = formatadorData.format(currentDate);
  }

  @override
  void initState() {
    super.initState();

    if (widget.initialTransactionEntity == null) {
      occurenceType = OccurrenceType.income.id;
      amount = "0,00";
      description = "";
      recurrenceValue = RecurrenceType.none.id;
      categoryValue = categoryList.first;
      installmentValue = 2;
      installmentAmount = 0;

      if (widget.monthKey != null) {
        var monthKeySplitted = widget.monthKey!.split(":");
        var month = int.parse(monthKeySplitted[0]);
        var year = int.parse(monthKeySplitted[1]);

        if (month == currentDate.month && year == currentDate.year) {
          dateController.text = formatadorData.format(currentDate);
        } else {
          var dueDate = DateTime(currentDate.year, month, 7);
          dateController.text = formatadorData.format(dueDate);
        }
      }
    } else {
      occurenceType = widget.initialTransactionEntity!.occurrenceType;
      description = widget.initialTransactionEntity!.description;
      recurrenceValue = widget.initialTransactionEntity!.recurrenceType;
      categoryValue = widget.initialTransactionEntity!.categories[0];
      installmentValue = widget.initialTransactionEntity!.installment ?? 2;
      amount =
          formatadorDecimal.format(widget.initialTransactionEntity!.amount);
      dateController.text =
          formatadorData.format(widget.initialTransactionEntity!.dueDate);
      if (recurrenceValue == RecurrenceType.installment.id) {
        installmentAmount =
            widget.initialTransactionEntity!.amount / installmentValue;
      } else {
        installmentAmount = 0;
      }
    }

    if (widget.formType == 2) {
      primaryColor = ThemeColors.blue;
    } else {
      primaryColor = ThemeColors.green;
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(widget.screenTitle),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 12, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text("Tipo da transação *",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              fillColor: WidgetStateColor.resolveWith(
                                  (states) => primaryColor),
                              title: Text(OccurrenceType.income.description,
                                  style: const TextStyle(color: Colors.white)),
                              value: OccurrenceType.income.id,
                              groupValue: occurenceType,
                              onChanged: updateOccurrenceType,
                            ),
                          ),
                          Flexible(
                              child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            fillColor: WidgetStateColor.resolveWith(
                                (states) => primaryColor),
                            title: Text(OccurrenceType.expense.description,
                                style: const TextStyle(color: Colors.white)),
                            value: OccurrenceType.expense.id,
                            groupValue: occurenceType,
                            onChanged: updateOccurrenceType,
                          ))
                        ],
                      )
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return requiredField;
                          }
                          return null;
                        },
                        cursorColor: primaryColor,
                        initialValue: description,
                        onChanged: updateDescription,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.description,
                              color: primaryColor,
                            ),
                            labelText: 'Descrição *',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return requiredField;
                          }
                          return null;
                        },
                        initialValue: amount,
                        cursorColor: primaryColor,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyPtBrInputFormatter()
                        ],
                        onChanged: (value) => {updateAmount(value)},
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.monetization_on,
                              color: primaryColor,
                            ),
                            labelText: 'Quantia *',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recorrência",
                            style: TextStyle(
                                color: ThemeColors.white.withOpacity(0.5)),
                          ),
                          Row(children: [
                            Icon(
                              Icons.sync,
                              color: primaryColor,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DropdownButtonFormField(
                                      value: RecurrenceType.getRecurrenceById(
                                              recurrenceValue)
                                          .description,
                                      dropdownColor: ThemeColors.darkGray,
                                      decoration: const InputDecoration(
                                          hintText: "",
                                          border: InputBorder.none),
                                      onChanged: handleChangeRecurrenceType,
                                      items: recurrenceList
                                          .map<DropdownMenuItem<String>>(
                                              (RecurrenceType value) {
                                        return DropdownMenuItem<String>(
                                            value: value.description,
                                            child: Text(
                                              value.description,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ));
                                      }).toList(),
                                    ),
                                    recurrenceValue ==
                                            RecurrenceType.installment.id
                                        ? Row(
                                            children: [
                                              IconButton(
                                                  onPressed:
                                                      decrementInstallment,
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: primaryColor,
                                                  )),
                                              Text(
                                                "$installmentValue",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              IconButton(
                                                  onPressed:
                                                      incrementInstallment,
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: primaryColor,
                                                  )),
                                              Text(
                                                "de ${formatadorDecimal.format(installmentAmount)}",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                ))
                          ])
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            cursorColor: primaryColor,
                            controller: dateController,
                            onTap: _selectDate,
                            readOnly: true,
                            decoration: InputDecoration(
                                label: Text(
                                  "Data de vencimento",
                                  style: TextStyle(
                                      color:
                                          ThemeColors.white.withOpacity(0.5)),
                                ),
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: primaryColor,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5))),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Categorias",
                            style: TextStyle(
                                color: ThemeColors.white.withOpacity(0.5)),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.category,
                                color: primaryColor,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                  child: DropdownButtonFormField(
                                value: categoryValue,
                                dropdownColor: ThemeColors.darkGray,
                                decoration: const InputDecoration(
                                    hintText: "", border: InputBorder.none),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    categoryValue = value!;
                                  });
                                },
                                items: categoryList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ));
                                }).toList(),
                              ))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: handleSubmitForm,
                          child: Text(
                            widget.formType == 1
                                ? 'Criar nova transação'
                                : "Editar transação",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )));
  }
}

class CurrencyPtBrInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
