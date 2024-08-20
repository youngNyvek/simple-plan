import 'package:flutter/material.dart';
import 'package:simple_plan/domain/entities/category_tag_entity.dart';

import 'categorie_tag.dart';

class CategoriesList extends StatelessWidget {
  final Color color;
  final List<CategoryTagEntity> listCategories;

  const CategoriesList(
      {super.key, required this.color, required this.listCategories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              width: double.infinity,
              child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: listCategories
                      .map((entry) =>
                          CategorieTag(label: entry.label, color: color))
                      .toList()),
            )),
        TextFormField(
          decoration: InputDecoration(
              suffixIcon: const Icon(Icons.send),
              suffixIconColor: color,
              labelText: 'Adicionar nova categoria *',
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: color)),
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.5))),
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
