import 'package:simple_plan/adapters/isarAdapter/categories/category_adapter.dart';
import 'package:simple_plan/adapters/isarAdapter/transactionEntries/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/category_entity.dart';

class InsertCategoryUseCase {
  final CategoryAdapter _categoryDb = CategoryAdapter();
  final TransactionEntryAdapter transactionDb = TransactionEntryAdapter();

  Future<void> execute(CategoryEntity entity) async {
    await transactionDb.executeInTransaction(() async {
      await _categoryDb.insert(entity);
    });
  }
}
