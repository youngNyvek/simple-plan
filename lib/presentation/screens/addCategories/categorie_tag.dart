import 'package:flutter/material.dart';

import '../../constants/theme_colors.dart';

class CategorieTag extends StatelessWidget {
  final String label;
  final Color color;

  const CategorieTag({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12, color: color)),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 6),
            width: 1,
            height: 18,
            color: color,
          ),
          const Icon(
            Icons.close,
            size: 18,
            color: ThemeColors.white,
          )
        ],
      ),
    );
  }
}
