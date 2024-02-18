import 'package:flutter/material.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/model/transaction_entry_model.dart';
import 'package:simple_plan/presentation/screens/home/components/expandable_fab.dart';
import 'package:simple_plan/domain/shared/enum/months.dart';
import 'package:simple_plan/domain/shared/enum/occurence_type.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';

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
  late String _monthKey;

  late List<TransactionEntryModel> mockCashFlow;

  _HomeState() {
    _selectedMonth = _now.month;
    _selectedYear = _now.year;
    mockCashFlow = [
      TransactionEntryModel.fromEntity(
          TransactionEntryEntity(
            id: 1,
            description: 'Monthly rent',
            amount: 1200.0,
            startDate: DateTime(2024, 1, 1),
            occurrenceType: 1,
            done: false,
            finishDate: DateTime(2025, 1, 1),
            monthlyPlanId: '1:2024',
          ),
          _selectedMonth,
          _selectedYear)
    ];
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
    return Padding(
        padding: const EdgeInsets.all(16),
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
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
            height: 156,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ThemeColors.darkGray,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          StringUtils.formatCurrency(10),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const Row(children: [
                          Text(
                            "Saldo Atual",
                            style: TextStyle(
                                color: ThemeColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.trending_flat, color: ThemeColors.blue),
                        ]),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringUtils.formatCurrency(3000),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        const Row(
                          children: [
                            Text(
                              "Despesas",
                              style: TextStyle(
                                  color: ThemeColors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.trending_down, color: ThemeColors.red),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringUtils.formatCurrency(3000),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Receitas",
                              style: TextStyle(
                                  color: ThemeColors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.trending_up, color: ThemeColors.green),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            )));
  }

  Widget cashFlowByMonth() {
    return Expanded(
        flex: 1,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.vertical,
          children: mockCashFlow
              .map((item) => Column(
                    children: [
                      cashFlowCard(item),
                      const SizedBox(
                        height: 18,
                      ),
                    ],
                  ))
              .toList(),
        ));
  }

  Widget cashFlowCard(TransactionEntryModel transactionEntry) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(children: [
        Icon(
          transactionEntry.occurrenceType == OccurrenceType.expense.id
              ? Icons.arrow_circle_down_rounded
              : Icons.arrow_circle_up_rounded,
          size: 26,
          color: transactionEntry.occurrenceType == OccurrenceType.expense.id
              ? ThemeColors.red
              : ThemeColors.green,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(children: [
                  Text(
                    "SAÚDE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "CUSTO FIXO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                Text(
                  transactionEntry.description,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transactionEntry.installmentAmount == null
                          ? StringUtils.formatCurrency(transactionEntry.amount)
                          : StringUtils.formatCurrency(
                              transactionEntry.installmentAmount!),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "${transactionEntry.currentInstallment}/${transactionEntry.finalInstallment}",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ],
            ))
      ]),
    );
  }
}
