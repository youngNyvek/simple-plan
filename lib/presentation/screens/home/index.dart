import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/model/transaction_entry_model.dart';
import 'package:simple_plan/presentation/screens/home/components/expandable_fab.dart';
import 'package:simple_plan/domain/shared/enum/months.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/amount_row.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/categories_row.dart';
import 'package:simple_plan/presentation/screens/home/components/transactionCard/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _floatingButtonIsOpened = false;
  final _now = DateTime.now();
  late int _selectedMonth;
  late int _selectedYear;
  late double _expenses = 0;
  late double _currentExpenses = 0;
  late double _currentIncomes = 0;
  late double _incomes = 0;
  late String _monthKey;

  late List<TransactionEntryModel> mockTransactionLists;

  _HomeState() {
    _selectedMonth = _now.month;
    _selectedYear = _now.year;
    mockTransactionLists = [
      TransactionEntryModel.fromEntity(
          TransactionEntryEntity(
              id: 1,
              description: 'Acâdemia',
              amount: 159,
              startDate: DateTime(2024, 1, 1),
              occurrenceType: 2,
              done: true,
              monthlyPlanId: '1:2024',
              createdAt: DateTime(2024, 1, 1)),
          _selectedMonth,
          _selectedYear),
      TransactionEntryModel.fromEntity(
          TransactionEntryEntity(
              id: 1,
              description: 'Salário',
              amount: 6000,
              startDate: DateTime(2024, 1, 1),
              occurrenceType: 1,
              done: true,
              monthlyPlanId: '1:2024',
              createdAt: DateTime(2024, 1, 1)),
          _selectedMonth,
          _selectedYear)
    ];

    final filteredExpenses = mockTransactionLists.where(
        (element) => element.occurrenceType == OccurrenceType.expense.id);

    final filteredIncomes = mockTransactionLists
        .where((element) => element.occurrenceType == OccurrenceType.income.id);

    if (filteredExpenses.isNotEmpty) {
      _expenses = filteredExpenses
          .map((element) => element.amount)
          .reduce((value, element) => value + element);

      final doneExpenses = filteredExpenses.where((element) => element.done);

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

      final doneIncomes = filteredIncomes.where((element) => element.done);

      if (doneIncomes.isNotEmpty) {
        _currentIncomes = filteredIncomes
            .map((element) => element.amount)
            .reduce((value, element) => value + element);
      }
    }
  }

  void changeFloatingState() {
    setState(() {
      _floatingButtonIsOpened = !_floatingButtonIsOpened;
    });
  }

  void changeMonthKey() {
    setState(() {
      _monthKey = "$_selectedMonth:$_selectedYear";
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
          selectedMonth(),
          principalData(),
          cashFlowByMonth()
        ])),
        floatingActionButton: const ExpandableFab());
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

  Widget principalData() {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ThemeColors.darkGray,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "DESPESAS",
                          style: TextStyle(
                              color: ThemeColors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.trending_down,
                          color: ThemeColors.red,
                          size: 16,
                        ),
                      ],
                    ),
                    Text(
                      StringUtils.formatCurrency(_currentExpenses),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "Previsto",
                      style: TextStyle(
                          color: ThemeColors.red.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    Text(
                      StringUtils.formatCurrency(_expenses),
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Row(children: [
                      Text(
                        "SALDO",
                        style: TextStyle(
                            color: ThemeColors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.trending_flat,
                          color: ThemeColors.blue, size: 16),
                    ]),
                    Text(
                      StringUtils.formatCurrency(
                          _currentIncomes - _currentExpenses),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "Previsto",
                      style: TextStyle(
                          color: ThemeColors.blue.withOpacity(0.7),
                          fontSize: 10),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      StringUtils.formatCurrency(_incomes - _expenses),
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.trending_up,
                            color: ThemeColors.green, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "RECEITAS",
                          style: TextStyle(
                            color: ThemeColors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      StringUtils.formatCurrency(_currentIncomes),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "Previsto",
                      style: TextStyle(
                          color: ThemeColors.green.withOpacity(0.7),
                          fontSize: 10),
                    ),
                    Text(
                      StringUtils.formatCurrency(_incomes),
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 12),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }

  Widget cashFlowByMonth() {
    return Expanded(
        flex: 1,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.vertical,
          children: mockTransactionLists
              .map((item) => Column(
                    children: [
                      TransactionCard(
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
