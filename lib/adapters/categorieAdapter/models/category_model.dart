import 'package:isar/isar.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';

part 'category_model.g.dart';

@Collection()
class CategoryModel {
  Id id = Isar.autoIncrement;
  final String label;
  final int ocurrenceType;
  final bool? excluded;

  CategoryModel(
      {required this.label, required this.ocurrenceType, this.excluded});

  CategoryModel.fromEntity(CategoryEntity entity)
      : id = entity.id ?? Isar.autoIncrement,
        label = entity.label,
        ocurrenceType = entity.ocurrenceType,
        excluded = null;

  CategoryEntity toEntity() {
    return CategoryEntity(label: label, ocurrenceType: ocurrenceType);
  }
}

extension ListTransactionEntity on List<CategoryModel> {
  List<CategoryEntity> toEntity() {
    return map((element) => element.toEntity()).toList();
  }
}
