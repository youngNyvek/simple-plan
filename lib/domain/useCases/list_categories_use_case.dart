import 'package:simple_plan/adapters/isarAdapter/categories/category_adapter.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';

class ListCategoriesUseCase {
  final CategoryAdapter _categoryDb = CategoryAdapter();

  Future<List<CategoryEntity>> execute(int? occurrenceType) async {
    return await _categoryDb.list(occurrenceType);
  }
}
