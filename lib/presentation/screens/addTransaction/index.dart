import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:simple_plan/domain/model/transactionEntry/transaction_entry_database.dart';
import 'package:simple_plan/domain/model/transactionEntry/transaction_entry_model.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';
import 'package:simple_plan/domain/useCases/insertTransactionEntryUseCase.dart';

const List<String> categoryList = <String>[
  'Custo Fixo',
  'Lazer',
  'Conforto',
  'Liberdade Finânceira'
];

const requiredField = "Obrigatório";

const dropdowMenuItem = [
  DropdownMenuItem<String>(
      value: "Sem recorrência", child: Text("Sem recorrência")),
  DropdownMenuItem<String>(value: "Fixo mensal", child: Text("Fixo mensal")),
  DropdownMenuItem<String>(value: "Sem recorrência", child: Text("Parcelado"))
];

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();
  final f = DateFormat("dd/MM/yyyy");
  final insertTransactionUseCase = InsertTransactionEntryUseCase();
  final recurrenceList = RecurrenceType.recurrenceList;

  TextEditingController dateController = TextEditingController();

  DateTime currentDate = DateTime.now();

  int? occurenceType = OccurrenceType.income.id;
  String amount = "0,00";
  String description = "";
  int recurrenceValue = RecurrenceType.none.id;
  String categoryValue = categoryList.first;
  int installmentValue = 12;

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
    });
  }

  void incrementInstallment() {
    setState(() {
      installmentValue++;
    });
  }

  void decrementInstallment() {
    setState(() {
      if (installmentValue > 1) {
        installmentValue--;
      }
    });
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );

      var dateSplitted = dateController.text.split("/");

      var monthPlanId =
          "${int.parse(dateSplitted[1])}:${int.parse(dateSplitted[2])}";

      try {
        await insertTransactionUseCase.execute(TransactionEntryModel(
            done: false,
            startDate: DateTime(int.parse(dateSplitted[2]),
                int.parse(dateSplitted[1]), int.parse(dateSplitted[0])),
            description: description,
            amount:
                double.parse(amount.replaceAll('.', '').replaceAll(',', '.')),
            occurrenceType: occurenceType!,
            monthlyPlanId: monthPlanId,
            recurrenceType: recurrenceValue,
            categories: [categoryValue]));

        if (!context.mounted) return;

        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text("Registro inserido com sucecsso!"),
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
  }

  _AddTransactionState() {
    dateController.text = f.format(currentDate);
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
          backgroundColor: ThemeColors.blue,
          title: const Text('Nova transação'),
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
                                  (states) => ThemeColors.blue),
                              title: Text(OccurrenceType.income.description,
                                  style: const TextStyle(color: Colors.white)),
                              value: OccurrenceType.income.id,
                              groupValue: occurenceType,
                              onChanged: (int? value) {
                                setState(() {
                                  occurenceType = value;
                                });
                              },
                            ),
                          ),
                          Flexible(
                              child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => ThemeColors.blue),
                            title: Text(OccurrenceType.expense.description,
                                style: const TextStyle(color: Colors.white)),
                            value: OccurrenceType.expense.id,
                            groupValue: occurenceType,
                            onChanged: (int? value) {
                              setState(() {
                                occurenceType = value;
                              });
                            },
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
                        cursorColor: ThemeColors.blue,
                        onChanged: (value) => {updateDescription(value)},
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.description,
                              color: ThemeColors.blue,
                            ),
                            labelText: 'Descrição *',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ThemeColors.blue)),
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
                        cursorColor: ThemeColors.blue,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyPtBrInputFormatter()
                        ],
                        onChanged: (value) => {updateAmount(value)},
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.monetization_on,
                              color: ThemeColors.blue,
                            ),
                            labelText: 'Quantia *',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ThemeColors.blue)),
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
                            const Icon(
                              Icons.sync,
                              color: ThemeColors.blue,
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
                                      value: recurrenceList.first.description,
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
                                    recurrenceValue == "Parcelado"
                                        ? Row(
                                            children: [
                                              Text(
                                                "$amount de",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              IconButton(
                                                  onPressed:
                                                      decrementInstallment,
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    color: ThemeColors.blue,
                                                  )),
                                              Text(
                                                "$installmentValue",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              IconButton(
                                                  onPressed:
                                                      incrementInstallment,
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: ThemeColors.blue,
                                                  ))
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
                            cursorColor: ThemeColors.blue,
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
                                icon: const Icon(
                                  Icons.calendar_month,
                                  color: ThemeColors.blue,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ThemeColors.blue)),
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
                              const Icon(
                                Icons.category,
                                color: ThemeColors.blue,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                  child: DropdownButtonFormField(
                                value: categoryList.first,
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
                          child: const Text(
                            'Criar nova transação',
                            style: TextStyle(color: ThemeColors.blue),
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
