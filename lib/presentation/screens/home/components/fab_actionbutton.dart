import 'package:flutter/material.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';

class FabActionButton extends StatelessWidget {
  final bool isOpen;
  final double right;
  final double bottom;
  final String label;
  final String? heroTag;
  final Widget icon;
  final VoidCallback onPressed;

  const FabActionButton(
      {super.key,
      required this.isOpen,
      this.right = 0,
      this.bottom = 0,
      this.heroTag,
      required this.label,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        right: isOpen ? right : -60,
        bottom: isOpen ? bottom : 0,
        duration: const Duration(milliseconds: 200),
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
        child: AnimatedContainer(
            transformAlignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
                isOpen ? 1.0 : 0.01, isOpen ? 1.0 : 0.01, isOpen ? 1.0 : 0.01),
            curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
            duration: const Duration(milliseconds: 200),
            child: FloatingActionButton.extended(
                heroTag: heroTag,
                backgroundColor: ThemeColors.blue,
                label: Text(label),
                onPressed: onPressed,
                icon: icon)));
  }
}
