import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_plan/domain/entities/category_tag_entity.dart';
import 'package:simple_plan/presentation/constants/labels.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';
import 'package:simple_plan/presentation/constants/theme_icons.dart';

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
            Center(
                child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: listCategories
                              .map((entry) => Container(
                                    color: ThemeColors.greenAlpha,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(entry.label.toUpperCase(),
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: ThemeColors.white)),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 8, right: 6),
                                          width: 1,
                                          height: 18,
                                          color: ThemeColors.whiteAlpha,
                                        ),
                                        const Icon(
                                          Icons.close,
                                          size: 18,
                                          color: ThemeColors.white,
                                        )
                                      ],
                                    ),
                                  ))
                              .toList()),
                    )),
                const Text("It's rainy here",
                    style: TextStyle(color: ThemeColors.white))
              ],
            )),
            const Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}
