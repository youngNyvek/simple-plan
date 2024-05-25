import 'package:isar/isar.dart';
import 'package:simple_plan/domain/entities/done_transaction_Entity.dart';

part 'done_transaction_model.g.dart';

@Collection()
class DoneTransactionModel {
  Id id = Isar.autoIncrement;
  final String monthKey;
  final int transactionId;
  final bool value;

  DoneTransactionModel(this.monthKey, this.transactionId, this.value);

  DoneTransactionModel.fromEntity(DoneTransactionEntity entity)
      : id = entity.id ?? Isar.autoIncrement,
        monthKey = entity.monthKey,
        transactionId = entity.transactionId,
        value = entity.value;

  DoneTransactionEntity toEntity() {
    return DoneTransactionEntity(
        id: id, monthKey: monthKey, transactionId: transactionId, value: value);
  }
}

extension MapTransactionEntity on List<DoneTransactionModel> {
  Map<int, DoneTransactionEntity> toEntity() {
    return {
      for (var element in this) element.transactionId: element.toEntity()
    };
  }
}
