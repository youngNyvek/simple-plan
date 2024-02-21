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
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  categories.last != item
                      ? Row(children: [
                          Text("•",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.2))),
                          const SizedBox(width: 4)
                        ])
                      : const SizedBox.shrink()
                ]))
            .toList());
  }
}
