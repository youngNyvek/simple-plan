import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';

import 'categorie_tag.dart';

class CategoriesList extends StatelessWidget {
  final Color color;
  final List<CategoryEntity> listCategories;
  final Future<void> Function() onTap;

  const CategoriesList(
      {super.key,
      required this.color,
      required this.listCategories,
      required this.onTap});

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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Flexible(
                  child: TextFormField(
                cursorColor: color,
                decoration: InputDecoration(
                    labelText: 'Adicionar nova categoria *',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color)),
                    labelStyle:
                        TextStyle(color: Colors.white.withOpacity(0.5))),
                style: const TextStyle(color: Colors.white),
              )),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                  onTap: onTap,
                  child: Icon(
                    Icons.send,
                    color: color,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
