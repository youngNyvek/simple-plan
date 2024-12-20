import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';
import 'package:simple_plan/domain/enums/occurence_type.dart';
import 'package:simple_plan/domain/useCases/delete_category_use_case.dart';
import 'package:simple_plan/domain/useCases/insert_category_use_case.dart';
import 'package:simple_plan/domain/useCases/list_categories_use_case.dart';
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
  final _listCategoriesUseCase = ListCategoriesUseCase();
  final _insertCategoryUseCase = InsertCategoryUseCase();
  final _deleteCategoryUseCase = DeleteCategoryUseCase();

  List<CategoryEntity> incomeCategoriesList = [];
  List<CategoryEntity> expenseCategoriesList = [];

  Future<void> setupCategoryList() async {
    var categories = await _listCategoriesUseCase.execute(null);

    List<CategoryEntity> auxIncomeCategorie = [];
    List<CategoryEntity> auxExpenseCategorie = [];

    for (var categorie in categories) {
      if (categorie.ocurrenceType == OccurrenceType.income.id) {
        auxIncomeCategorie.add(categorie);
      } else {
        auxExpenseCategorie.add(categorie);
      }
    }

    setState(() {
      incomeCategoriesList = auxIncomeCategorie;
      expenseCategoriesList = auxExpenseCategorie;
    });
  }

  Future<void> addIncomeCategory(String label) async {
    var category =
        CategoryEntity(label: label, ocurrenceType: OccurrenceType.income.id);
    await _insertCategoryUseCase.execute(category);
    setupCategoryList();
  }

  Future<void> addExpenseCategory(String label) async {
    var category =
        CategoryEntity(label: label, ocurrenceType: OccurrenceType.expense.id);
    await _insertCategoryUseCase.execute(category);
    setupCategoryList();
  }

  Future<void> delete(int categoryId) async {
    await _deleteCategoryUseCase.execute(categoryId);
    setupCategoryList();
  }

  @override
  void initState() {
    super.initState();
    setupCategoryList();
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
          children: [
            CategoriesList(
              color: ThemeColors.green,
              listCategories: incomeCategoriesList,
              onSubmit: addIncomeCategory,
              onCloseTap: delete,
            ),
            CategoriesList(
              color: ThemeColors.red,
              listCategories: expenseCategoriesList,
              onSubmit: addExpenseCategory,
              onCloseTap: delete,
            ),
          ],
        ),
      ),
    );
  }
}
