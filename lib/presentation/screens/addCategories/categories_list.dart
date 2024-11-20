import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';
import 'package:simple_plan/presentation/constants/messages.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';

import 'categorie_tag.dart';

class CategoriesList extends StatefulWidget {
  final Color color;
  final List<CategoryEntity> listCategories;
  final void Function(String label) onSubmit;
  final void Function(int categoryId) onCloseTap;

  const CategoriesList({
    super.key,
    required this.color,
    required this.listCategories,
    required this.onSubmit,
    required this.onCloseTap,
  });

  @override
  CategoriesListState createState() => CategoriesListState();
}

class CategoriesListState extends State<CategoriesList> {
  final _formKey = GlobalKey<FormState>();

  String _description = '';

  void updateDescription(String value) {
    setState(() {
      _description = value;
    });
  }

  void handleClose(CategoryEntity entry) {
    widget.onCloseTap(entry.id!);
  }

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
              children: widget.listCategories
                  .map((entry) => CategorieTag(
                      label: entry.label,
                      color: widget.color,
                      onCloseTap: widget.listCategories.length > 1
                          ? () {
                              handleClose(entry);
                            }
                          : null))
                  .toList(),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: ThemeColors.dark,
          child: Row(
            children: [
              Flexible(
                child: Form(
                    key: _formKey,
                    child: TextFormField(
                      cursorColor: widget.color,
                      onChanged: updateDescription,
                      initialValue: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return requiredField;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Adicionar nova categoria *',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: widget.color),
                        ),
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                width: 12,
              ),
              IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onSubmit(_description);
                      _formKey.currentState!.reset();
                      FocusScope.of(context).unfocus();
                    }
                  },
                  color: Colors.white,
                  icon: Icon(
                    Icons.send,
                    color: widget.color,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
