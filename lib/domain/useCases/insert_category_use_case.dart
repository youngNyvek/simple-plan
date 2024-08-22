import 'package:simple_plan/adapters/categorieAdapter/category_adapter.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';

class InsertCategoryUseCase {
  final CategoryAdapter _categoryDb = CategoryAdapter();

  Future<void> execute(CategoryEntity entity) async {
    await _categoryDb.insert(entity);
  }
}
