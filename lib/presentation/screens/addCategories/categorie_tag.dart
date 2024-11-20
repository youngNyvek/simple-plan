import 'package:flutter/material.dart';

import '../../constants/theme_colors.dart';

class CategorieTag extends StatelessWidget {
  final String label;
  final Color color;
  final void Function()? onCloseTap;

  const CategorieTag(
      {super.key,
      required this.label,
      required this.color,
      required this.onCloseTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12, color: color)),
          Container(
            margin: const EdgeInsets.only(left: 12),
            width: 1,
            height: 18,
            color: color,
          ),
          SizedBox(
            height: 30,
            width: 30,
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minHeight: 25, minWidth: 25),
                onPressed: onCloseTap,
                color: Colors.white,
                disabledColor: ThemeColors.whiteAlpha,
                icon: const Icon(
                  Icons.close,
                  size: 18,
                )),
          )
        ],
      ),
    );
  }
}
