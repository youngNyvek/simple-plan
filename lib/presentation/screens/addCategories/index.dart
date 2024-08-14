import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_plan/presentation/constants/labels.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';
import 'package:simple_plan/presentation/constants/theme_icons.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  var listCategories = {1: "teste", 2: "teste"};

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
        body: const TabBarView(
          children: <Widget>[
            Center(
                child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Text("It's rainy here",
                        style: TextStyle(color: ThemeColors.white))),
                Text("It's rainy here",
                    style: TextStyle(color: ThemeColors.white))
              ],
            )),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}
