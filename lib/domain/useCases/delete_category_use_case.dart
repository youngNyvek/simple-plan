import 'package:simple_plan/adapters/isarAdapter/categories/category_adapter.dart';

class DeleteCategoryUseCase {
  final CategoryAdapter _categoryDb = CategoryAdapter();

  Future<void> execute(int categoryId) async {
    await _categoryDb.executeInTransaction(() async {
      await _categoryDb.delete(categoryId);
    });
  }
}
