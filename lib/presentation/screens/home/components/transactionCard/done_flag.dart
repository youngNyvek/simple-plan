import 'package:flutter/cupertino.dart';
import 'package:simple_plan/domain/enums/occurence_type.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';

class DoneFlag extends StatelessWidget {
  final bool done;
  final int occurenceType;

  const DoneFlag({super.key, required this.done, required this.occurenceType});

  @override
  Widget build(BuildContext context) {
    if (done) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: ThemeColors.green.withOpacity(0.2),
        ),
        child: Text(
            occurenceType == OccurrenceType.income.id ? "RECEBIDO" : "PAGO",
            style: TextStyle(
                color: ThemeColors.green.withOpacity(0.8),
                fontSize: 10,
                fontWeight: FontWeight.bold)),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: ThemeColors.red.withOpacity(0.2),
        ),
        child: Text(
            occurenceType == OccurrenceType.income.id ? "A RECEBER" : "A PAGAR",
            style: TextStyle(
                color: ThemeColors.red.withOpacity(0.8),
                fontSize: 10,
                fontWeight: FontWeight.bold)),
      );
    }
  }
}
