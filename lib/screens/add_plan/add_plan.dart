import 'package:flutter/material.dart';

class AddPlan extends StatelessWidget {
  const AddPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Row(
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
              const Text("Novo plano mensal",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          )
        ]),
      )),
    );
  }
}
