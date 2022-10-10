import 'package:flutter/material.dart';
import 'package:simple_plan/shared/enum/months.dart';
import 'package:simple_plan/shared/utils/theme_colors.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({super.key});

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  int? selectedId = 1;

  @override
  void initState() {
    super.initState();
  }

  void _handleSelectMonth(int id) {
    setState(() {
      selectedId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Novo plano mensal",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    Text(
                      "Campos com * são obrigatórios",
                      style: TextStyle(color: ThemeColors.darkGray),
                      textDirection: TextDirection.ltr,
                    )
                  ],
                )
              ],
            )
          ]),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Mês",
                  style: TextStyle(
                      color: ThemeColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Selecione o mês do plano",
                  style: TextStyle(color: ThemeColors.darkGray),
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          ),
        ]),
        SizedBox(
          height: 70,
          child: ListView(
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              children: Months.listOf
                  .map((e) => Row(children: [
                        _monthBox(e.number, e.name),
                        const SizedBox(width: 16)
                      ]))
                  .toList()),
        ),
      ])),
    );
  }

  Widget _monthBox(int number, String name) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => {_handleSelectMonth(number)},
      hoverColor: Colors.amber,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ThemeColors.darkGray),
          width: 70,
          height: 70,
          child: Stack(children: [
            Center(
                child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ThemeColors.blue),
                    duration: const Duration(milliseconds: 400),
                    height: selectedId == number ? 70 : 0,
                    width: selectedId == number ? 70 : 0)),
            Center(
                child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ))
          ])),
    );
  }
}
