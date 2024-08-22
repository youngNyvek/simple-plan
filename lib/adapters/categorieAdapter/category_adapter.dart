import 'package:isar/isar.dart';
import 'package:simple_plan/adapters/categorieAdapter/models/category_model.dart';
import 'package:simple_plan/adapters/isar_adapter_base.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';

class CategoryAdapter extends IsarAdapterBase {
  static final db = IsarAdapterBase.db;

  Future<List<CategoryEntity>> list() async {
    var categoryModels = await db.categoryModels.where().findAll();

    return categoryModels.toEntity();
  }

  Future<int> insert(CategoryEntity entity) async {
    var model = CategoryModel.fromEntity(entity);

    return await db.categoryModels.put(model);
  }

  Future<void> delete(int id) async {
    await db.categoryModels.delete(id);
  }
}
