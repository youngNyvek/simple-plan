import 'package:flutter/material.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';

class AmountRow extends StatelessWidget {
  final double amount;
  final int? finalInstallment;
  final int? currentInstallment;

  const AmountRow(
      {super.key,
      required this.amount,
      required this.finalInstallment,
      required this.currentInstallment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringUtils.formatCurrency(amount),
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        Text(
          finalInstallment != null
              ? "$currentInstallment/$finalInstallment"
              : "",
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
