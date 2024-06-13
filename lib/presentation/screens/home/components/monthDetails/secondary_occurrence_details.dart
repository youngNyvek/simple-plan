import 'package:flutter/material.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';

class SecondaryOccurrenceDetails extends StatelessWidget {
  final double value;
  final String label;
  final Color primaryColor;
  final CrossAxisAlignment crossAxisAlignment;

  const SecondaryOccurrenceDetails(
      {super.key,
      required this.value,
      required this.label,
      required this.primaryColor,
      required this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: crossAxisAlignment, children: [
      Text(
        label,
        style: TextStyle(
            color: primaryColor.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 10),
      ),
      Text(
        StringUtils.formatCurrency(value),
        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
      )
    ]);
  }
}
