import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';

const List<String> categoryList = <String>[
  'Custo Fixo',
  'Lazer',
  'Conforto',
  'Liberdade Finânceira',
  'Liberdade Finânceira',
  'Liberdade Finânceira',
  'Liberdade Finânceira',
  'Liberdade Finânceira',
];

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  static const detailScreenFormType = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ThemeColors.blue,
        title: const Text("Detalhes da transação"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: categoryList
                  .map((item) => Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: ThemeColors.redAlpha),
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        margin: const EdgeInsets.all(4),
                        child: Text(
                          item.toUpperCase(),
                          style: TextStyle(
                              color: ThemeColors.redAlpha,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "R\$ 500,00",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_circle_down_rounded,
                    size: 28, color: ThemeColors.red)
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Parcela do carro 4/12",
              style: TextStyle(color: ThemeColors.redAlpha, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                const Text(
                  "Fixo Mensal",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "RECORRÊNCIA",
                  style: TextStyle(color: ThemeColors.whiteAlpha, fontSize: 12),
                )
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                const Text(
                  "05/04/2024",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "VENCIMENTO",
                  style: TextStyle(color: ThemeColors.whiteAlpha, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
