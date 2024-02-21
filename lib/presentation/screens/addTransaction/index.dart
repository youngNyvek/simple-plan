import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';

const List<String> list = <String>[
  'Sem recorrência',
  'Fixo mensal',
  'Parcelado'
];

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

// Create a corresponding State class.
// This class holds data related to the form.

class _AddTransactionState extends State<AddTransaction> {
  final textController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  int? occurenceType = OccurrenceType.income.id;
  String amount = "0,00";
  DateTime selectedDate = DateTime.now();
  String dropdownValue = list.first;
  int installmentValue = 12;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
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
      if (installmentValue > 0) {
        installmentValue--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.blue,
          title: const Text('Nova transação'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tipo da transação *",
                          style: TextStyle(color: Colors.white)),
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
                  ),
                  TextFormField(
                    controller: textController,
                    cursorColor: ThemeColors.blue,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyPtBrInputFormatter()
                    ],
                    onChanged: (value) => {updateAmount(value)},
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.monetization_on,
                          color: ThemeColors.pink,
                        ),
                        labelText: 'Quantia *',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ThemeColors.blue)),
                        labelStyle: TextStyle(color: Colors.white)),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    const Icon(
                      Icons.sync,
                      color: ThemeColors.pink,
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
                              value: list.first,
                              dropdownColor: ThemeColors.darkGray,
                              decoration: const InputDecoration(
                                  hintText: "", border: InputBorder.none),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ));
                              }).toList(),
                            ),
                            dropdownValue == "Parcelado"
                                ? Row(
                                    children: [
                                      Text(
                                        "$amount de",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      IconButton(
                                          onPressed: decrementInstallment,
                                          icon: Icon(
                                            Icons.remove,
                                            color: ThemeColors.blue,
                                          )),
                                      Text(
                                        "$installmentValue",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      IconButton(
                                          onPressed: incrementInstallment,
                                          icon: Icon(
                                            Icons.add,
                                            color: ThemeColors.blue,
                                          ))
                                    ],
                                  )
                                : const SizedBox.shrink()
                          ],
                        ))
                  ]),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: ThemeColors.pink,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Data",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "${DateFormat.yMd().format(selectedDate)}",
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
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
