import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/useCases/get_month_details_use_case/index.dart';
import 'package:simple_plan/domain/useCases/list_transactions_use_case.dart';
import 'package:simple_plan/presentation/screens/details/index.dart';
import 'package:simple_plan/presentation/screens/home/components/expandable_fab.dart';
import 'package:simple_plan/domain/enums/months.dart';
import 'package:simple_plan/domain/enums/occurence_type.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';
import 'package:simple_plan/presentation/screens/home/components/monthDetails/index.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _now = DateTime.now();
  final listTransactionsUseCase = ListTransactionsUseCase();
  final getMonthDetailsUseCase = GetMonthDetailsUseCase();

  bool _floatingButtonIsOpened = false;
  late int _selectedMonth = _now.month;
  late int _selectedYear = _now.year;
  late double _expenses = 0;
  late double _currentExpenses = 0;
  late double _currentIncomes = 0;
  late double _incomes = 0;
  late String _monthKey = "$_selectedMonth:$_selectedYear";
  late DateTime selectedDate = DateTime(_selectedYear, _selectedMonth, 1);
  late List<TransactionEntryEntity> transactionList = [];

  Future<void> setupList() async {
    var monthDetails = await getMonthDetailsUseCase.execute(_monthKey);
    var returnedTransactions = await listTransactionsUseCase.execute(_monthKey);

    setState(() {
      _expenses = monthDetails.predictedExpenses;
      _currentExpenses = monthDetails.currentExpenses;
      _currentIncomes = monthDetails.currentIncomes;
      _incomes = monthDetails.predictedIncomes;
      transactionList = returnedTransactions;
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

      selectedDate = DateTime(_selectedYear, _selectedMonth, 1);
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

      selectedDate = DateTime(_selectedYear, _selectedMonth, 1);
    });

    changeMonthKey();
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
        floatingActionButton: ExpandableFab(
          onGoBack: setupList,
          monthKey: _monthKey,
        ));
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
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          final item = transactionList[index];
          return Column(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        selectedDate: selectedDate,
                        transactionEntryEntity: item),
                  ),
                ).then((dadosAtualizados) {
                  setupList();
                }),
                child: TransactionCard(
                  key: Key("${item.id}"),
                  done: item.done,
                  amount: item.amount,
                  categories: item.categories,
                  description: item.description,
                  installment: item.installment,
                  currentInstallment: item.getCurrentInstallment(selectedDate),
                  occurrenceType: item.occurrenceType,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              if (index == transactionList.length - 1)
                const Padding(
                  padding: EdgeInsets.only(bottom: 60.0),
                ),
            ],
          );
        },
      ),
    );
  }
}
