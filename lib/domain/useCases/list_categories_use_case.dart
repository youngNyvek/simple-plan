import 'package:simple_plan/adapters/categorieAdapter/category_adapter.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';

class ListCategoriesUseCase {
  final CategoryAdapter _categoryDb = CategoryAdapter();

  Future<List<CategoryEntity>> execute() async {
    return await _categoryDb.list();
  }
}
