import 'package:flutter/material.dart';
import 'package:simple_plan/screens/home/components/fab_actionbutton.dart';
import 'package:simple_plan/shared/constants.dart';
import 'package:simple_plan/shared/utils/theme_colors.dart';

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({super.key});

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> {
  bool _open = false;

  @override
  void initState() {
    super.initState();
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
              label: Constants.addPlanLabel,
              onPressed: () => {Navigator.pushNamed(context, '/addPlan')}),
          FabActionButton(
              isOpen: _open,
              bottom: 70,
              icon: const Icon(Icons.group_work),
              label: "Nova Categoria",
              onPressed: () => {}),
          _buildTapToCloseFab(),
          _buildTapToOpenFab()
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.rotationZ(_open ? 0 : 1),
      duration: const Duration(milliseconds: 250),
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      child: FloatingActionButton(
        heroTag: "clsBtn",
        onPressed: _toggle,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.close,
          color: ThemeColors.blue,
        ),
      ),
    );
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.rotationZ(_open ? 1 : 0),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            heroTag: "opnBtn",
            onPressed: _toggle,
            child: const Icon(Icons.add, size: 30),
          ),
        ),
      ),
    );
  }
}
