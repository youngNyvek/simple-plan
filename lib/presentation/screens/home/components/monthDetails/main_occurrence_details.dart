import 'package:flutter/material.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';

class MainOccurrenceDetails extends StatelessWidget {
  final Color primaryColor;
  final double currentValue;
  final String label;
  final IconData icon;
  final CrossAxisAlignment crossAxisAlignment;

  const MainOccurrenceDetails(
      {super.key,
      required this.primaryColor,
      required this.currentValue,
      required this.label,
      required this.icon,
      required this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            const SizedBox(width: 4),
            Icon(
              icon,
              color: primaryColor,
              size: 16,
            ),
          ],
        ),
        Text(
          StringUtils.formatCurrency(currentValue),
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
