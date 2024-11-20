import 'package:flutter/material.dart';
import 'package:simple_plan/presentation/constants/labels.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';
import 'package:simple_plan/presentation/screens/home/components/monthDetails/main_occurrence_details.dart';
import 'package:simple_plan/presentation/screens/home/components/monthDetails/secondary_occurrence_details.dart';

class MonthDetail extends StatefulWidget {
  final double currentExpenses;
  final double expenses;
  final double currentIncomes;
  final double incomes;

  const MonthDetail(
      {super.key,
      required this.currentExpenses,
      required this.expenses,
      required this.currentIncomes,
      required this.incomes});

  @override
  State<MonthDetail> createState() => _MonthDetailState();
}

class _MonthDetailState extends State<MonthDetail>
    with SingleTickerProviderStateMixin {
  bool showPicker = false;
  late AnimationController _controller;

  handleToggleMostDetails() {
    setState(() {
      showPicker = !showPicker;
      if (showPicker) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                MainOccurrenceDetails(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    currentValue: widget.currentExpenses,
                    icon: Icons.trending_down,
                    label: Labels.expense.toUpperCase(),
                    primaryColor: ThemeColors.red),
                MainOccurrenceDetails(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    currentValue:
                        widget.currentIncomes - widget.currentExpenses,
                    // expectedValue: widget.incomes - widget.expenses,
                    icon: Icons.trending_flat,
                    label: Labels.balance.toUpperCase(),
                    primaryColor: ThemeColors.blue),
                MainOccurrenceDetails(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    currentValue: widget.currentIncomes,
                    // expectedValue: widget.incomes,
                    icon: Icons.trending_up,
                    label: Labels.income.toUpperCase(),
                    primaryColor: ThemeColors.green),
              ],
            ),
            SizeTransition(
              sizeFactor: CurvedAnimation(
                  parent: _controller, curve: Curves.easeOutBack),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryOccurrenceDetails(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          value: widget.expenses,
                          label: "PREVISTO",
                          primaryColor: ThemeColors.red),
                      SecondaryOccurrenceDetails(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          value: widget.incomes - widget.expenses,
                          label: "PREVISTO",
                          primaryColor: ThemeColors.blue),
                      SecondaryOccurrenceDetails(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          value: widget.incomes,
                          label: "PREVISTO",
                          primaryColor: ThemeColors.green),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryOccurrenceDetails(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          value: widget.expenses - widget.currentExpenses,
                          label: "A PAGAR",
                          primaryColor: ThemeColors.red),
                      SecondaryOccurrenceDetails(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          value: widget.incomes - widget.currentIncomes,
                          label: "A RECEBER",
                          primaryColor: ThemeColors.green),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            InkWell(
                onTap: handleToggleMostDetails,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      showPicker ? "Menos detalhes" : "Mais detalhes",
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    Icon(
                      showPicker ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white.withOpacity(0.5),
                    )
                  ],
                ))
          ],
        ));
  }
}
