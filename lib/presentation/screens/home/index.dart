import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_plan/domain/adapters/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/model/transactionEntry/dynamic_transaction_entry_model.dart';
import 'package:simple_plan/presentation/screens/home/components/expandable_fab.dart';
import 'package:simple_plan/domain/shared/enum/months.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';
import 'package:simple_plan/presentation/screens/home/components/monthDetails/index.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _floatingButtonIsOpened = false;
  final _now = DateTime.now();
  late int _selectedMonth = _now.month;
  late int _selectedYear = _now.year;
  late double _expenses = 0;
  late double _currentExpenses = 0;
  late double _currentIncomes = 0;
  late double _incomes = 0;
  late String _monthKey = "$_selectedMonth:$_selectedYear";
  late List<DynamicTransactionEntryModel> transactionList = [];

  Future<void> setupList() async {
    var returnedList =
        await DynamicTransactionEntryAdapter().listDynamics(_monthKey);

    var returnedList2 =
        await DynamicTransactionEntryAdapter().listFixeds(_monthKey);

    var filteredExpenses = returnedList.where(
        (element) => element.occurrenceType == OccurrenceType.expense.id);

    var filteredIncomes = returnedList
        .where((element) => element.occurrenceType == OccurrenceType.income.id);

    setState(() {
      transactionList = returnedList;
      if (filteredExpenses.isNotEmpty) {
        _expenses = filteredExpenses
            .map((element) => element.amount)
            .reduce((value, element) => value + element);

        var doneExpenses = filteredExpenses.where((element) => element.done);

        if (doneExpenses.isNotEmpty) {
          _currentExpenses = doneExpenses
              .map((element) => element.amount)
              .reduce((value, element) => value + element);
        }
      }

      if (filteredIncomes.isNotEmpty) {
        _incomes = filteredIncomes
            .map((element) => element.amount)
            .reduce((value, element) => value + element);

        var doneIncomes = filteredIncomes.where((element) => element.done);

        if (doneIncomes.isNotEmpty) {
          _currentIncomes = doneIncomes
              .map((element) => element.amount)
              .reduce((value, element) => value + element);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setupList();
  }

  void changeFloatingState() {
    setState(() {
      _floatingButtonIsOpened = !_floatingButtonIsOpened;
    });
  }

  void changeMonthKey() async {
    setState(() {
      _monthKey = "$_selectedMonth:$_selectedYear";
    });
    setupList();
  }

  void handlePreviousMonth() {
    setState(() {
      if (_selectedMonth == Month.jan.number) {
        _selectedMonth = Month.dec.number;
        _selectedYear = _selectedYear - 1;
      } else {
        _selectedMonth = _selectedMonth - 1;
      }
    });

    changeMonthKey();
  }

  void handleNextMonth() {
    setState(() {
      if (_selectedMonth == Month.dec.number) {
        _selectedMonth = Month.jan.number;
        _selectedYear = _selectedYear + 1;
      } else {
        _selectedMonth = _selectedMonth + 1;
      }
    });

    changeMonthKey();
  }

  FutureOr onGoBack(dynamic value) async {
    await setupList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
          selectedMonth(),
          MonthDetail(
              currentExpenses: _currentExpenses,
              expenses: _expenses,
              currentIncomes: _currentIncomes,
              incomes: _incomes),
          cashFlowByMonth()
        ])),
        floatingActionButton: ExpandableFab(onGoBack: onGoBack));
  }

  Widget selectedMonth() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 40),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            IconButton(
                icon: const Icon(Icons.chevron_left),
                tooltip: 'Back to previous month',
                color: Colors.white,
                onPressed: handlePreviousMonth),
          ]),
          Row(
            children: [
              Text(
                "${Month.getMonth(_selectedMonth).name} | $_selectedYear ",
                style: const TextStyle(
                    color: ThemeColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  icon: const Icon(Icons.chevron_right),
                  tooltip: 'Back to next month',
                  color: Colors.white,
                  onPressed: handleNextMonth),
            ],
          )
        ]));
  }

  Widget cashFlowByMonth() {
    return Expanded(
        flex: 1,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.vertical,
          children: transactionList
              .map((item) => Column(
                    children: [
                      TransactionCard(
                          key: Key("${item.id}"),
                          done: item.done,
                          amount: item.amount,
                          categories: item.categories,
                          currentInstallment: item.currentInstallment,
                          description: item.description,
                          finalInstallment: item.finalInstallment,
                          occurrenceType: item.occurrenceType),
                      const SizedBox(
                        height: 22,
                      ),
                    ],
                  ))
              .toList(),
        ));
  }
}
