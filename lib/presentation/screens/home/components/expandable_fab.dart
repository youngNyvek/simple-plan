import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_plan/presentation/screens/addCategories/index.dart';
import 'package:simple_plan/presentation/screens/addTransaction/index.dart';
import 'package:simple_plan/presentation/screens/home/components/fab_actionbutton.dart';
import 'package:simple_plan/presentation/constants/labels.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';

class ExpandableFab extends StatefulWidget {
  final FutureOr Function() onGoBack;
  final String monthKey;

  const ExpandableFab(
      {super.key, required this.onGoBack, required this.monthKey});

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> {
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = false;
  }

  void _toggle() {
    setState(() {
      _open = !_open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          FabActionButton(
              isOpen: _open,
              right: 70,
              icon: const Icon(Icons.library_add),
              label: Labels.addPlanLabel,
              onPressed: () => {
                    _toggle(),
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddTransaction(monthKey: widget.monthKey)))
                        .then((dadosAtualizados) {
                      widget.onGoBack();
                    })
                  }),
          FabActionButton(
              isOpen: _open,
              bottom: 70,
              icon: const Icon(Icons.group_work),
              label: "Nova Categoria",
              onPressed: () => {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddCategories()))
                        .then((dadosAtualizados) {
                      widget.onGoBack();
                    })
                  }),
          _exapandButton()
        ],
      ),
    );
  }

  Widget _exapandButton() {
    return AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.rotationZ(_open ? 0 : 2.4),
      duration: const Duration(milliseconds: 250),
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      child: FloatingActionButton(
        heroTag: "clsBtn",
        onPressed: _toggle,
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.close,
          color: _open ? ThemeColors.blue : ThemeColors.pink,
        ),
      ),
    );
  }
}
