import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';
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

const dropdowMenuItem = [
  DropdownMenuItem<String>(
      value: "Sem recorrência", child: Text("Sem recorrência")),
  DropdownMenuItem<String>(value: "Fixo mensal", child: Text("Fixo mensal")),
  DropdownMenuItem<String>(value: "Sem recorrência", child: Text("Parcelado"))
];

class TransactionForm extends StatefulWidget {
  final String screenTitle;
  final int formType;
  final TransactionEntryEntity? initialTransactionEntity;

  const TransactionForm(
      {super.key,
      required this.screenTitle,
      required this.formType,
      required this.initialTransactionEntity});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final f = DateFormat("dd/MM/yyyy");
  final insertTransactionUseCase = InsertTransactionEntryUseCase();
  final recurrenceList = RecurrenceType.recurrenceList;
  final formatador = NumberFormat("#,##0.00", "pt_BR");

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

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(currentDate.year - 10),
        lastDate: DateTime(currentDate.year + 10));

    if (picked != null) setState(() => dateController.text = f.format(picked));
  }

  void updateDescription(value) {
    setState(() {
      description = value;
    });
  }

  void updateAmount(value) {
    setState(() {
      amount = value;
      if (recurrenceValue == RecurrenceType.installment.id) {
        installmentAmount = convertStringToDouble(amount) / installmentValue;
      }
    });
  }

  void incrementInstallment() {
    setState(() {
      installmentValue++;
      installmentAmount = convertStringToDouble(amount) / installmentValue;
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

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );

      var dateSplitted = dateController.text.split("/");

      var transactionEntity = TransactionEntryEntity(
          id: widget.initialTransactionEntity?.id,
          done: false,
          dueDate: DateTime.utc(int.parse(dateSplitted[2]),
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

        if (!context.mounted) return;

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
    dateController.text = f.format(currentDate);
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
    } else {
      occurenceType = widget.initialTransactionEntity!.occurrenceType;
      description = widget.initialTransactionEntity!.description;
      recurrenceValue = widget.initialTransactionEntity!.recurrenceType;
      categoryValue = widget.initialTransactionEntity!.categories[0];
      installmentValue = widget.initialTransactionEntity!.installment ?? 2;
      amount = formatador.format(widget.initialTransactionEntity!.amount);
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
        body: Form(
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
                              fillColor: MaterialStateColor.resolveWith(
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
                            fillColor: MaterialStateColor.resolveWith(
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
                        onChanged: (value) => {updateDescription(value)},
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
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          recurrenceValue = RecurrenceType
                                                  .getRecurrenceByDesc(value!)
                                              .id;
                                        });
                                      },
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
                                                "de ${formatador.format(installmentAmount)}",
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
                          onPressed: submitForm,
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
        ));
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
