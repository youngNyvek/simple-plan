import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_plan/domain/entities/category_tag_entity.dart';
import 'package:simple_plan/presentation/constants/labels.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';
import 'package:simple_plan/presentation/constants/theme_icons.dart';
import 'package:simple_plan/presentation/screens/addCategories/categorie_tag.dart';
import 'package:simple_plan/presentation/screens/addCategories/categories_list.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  final listCategories = [
    CategoryTagEntity(label: "Salário", ocurrenceType: 1),
    CategoryTagEntity(label: "Proventos", ocurrenceType: 1),
    CategoryTagEntity(label: "Freelancer", ocurrenceType: 1),
    CategoryTagEntity(label: "Freelancer", ocurrenceType: 1),
    CategoryTagEntity(label: "Freelancer", ocurrenceType: 1),
    CategoryTagEntity(label: "Freelancer", ocurrenceType: 1),
    CategoryTagEntity(label: "Freelancer", ocurrenceType: 1),
    CategoryTagEntity(label: "Salário", ocurrenceType: 1),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categorias',
            style: TextStyle(color: ThemeColors.white),
          ),
          backgroundColor: ThemeColors.darkGray,
          iconTheme: const IconThemeData(color: ThemeColors.white),
          bottom: const TabBar(
            dividerHeight: 0,
            indicatorColor: ThemeColors.blue,
            labelStyle: TextStyle(color: ThemeColors.white),
            tabs: <Widget>[
              Tab(
                icon: Icon(ThemeIcons.income, color: ThemeColors.green),
                text: Labels.income,
              ),
              Tab(
                icon: Icon(ThemeIcons.expense, color: ThemeColors.red),
                text: Labels.expense,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesList(
                color: ThemeColors.green, listCategories: listCategories),
            CategoriesList(
                color: ThemeColors.red, listCategories: listCategories),
          ],
        ),
      ),
    );
  }
}
