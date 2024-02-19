import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  final List<String> categories;

  const CategoriesRow({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: categories
            .map((item) => Row(children: [
                  Text(
                    item.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  categories.last != item
                      ? const Row(children: [
                          Text("•", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 4)
                        ])
                      : const SizedBox.shrink()
                ]))
            .toList());
  }
}
