// import 'package:isar/isar.dart';
// import 'package:simple_plan/adapters/firestoreAdapter/firestore_adapter_base.dart';
// import 'package:simple_plan/adapters/isarAdapter/isar_adapter_base.dart';
// import 'package:simple_plan/adapters/isarAdapter/transactionEntries/models/transaction_entry_model.dart';
// import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
// import 'package:simple_plan/domain/enums/recurrence_type.dart';
// import 'package:simple_plan/domain/shared/utils/string_utils.dart';

// class TransactionEntryAdapter extends FirestoreAdapterBase {
//   static final collection =
//       FirestoreAdapterBase.db.collection("transactionEntries");

//   Future<String> insertTransaction(TransactionEntryEntity entity) async {
//     var data = entity.toMap();
//     var docRef = await collection.add(data);

//     return docRef.id;
//   }

//   Future<List<TransactionEntryEntity>> listTransactions(
//       DateTime lowerDate, DateTime upperDate) async {
//     var monthKey = StringUtils.getMonthKey(lowerDate);

//     var query = collection
//         .where('excludedMonths', arrayContains: monthKey, isNotEqualTo: true)
//         .where('dueDate', isGreaterThanOrEqualTo: lowerDate)
//         .where('dueDate', isLessThanOrEqualTo: upperDate);

//     var snapshot = await query.get();
//     return snapshot.docs
//         .map((doc) => TransactionEntryEntity.fromMap(doc.data()))
//         .toList();
//   }

//   Future<void> deleteTransaction(String id) async {
//     await collection.doc(id).delete();
//   }

//   Future<void> addExcludedMonth(String transactionId, String monthKey) async {
//     var doc = await collection.doc(transactionId).get();
//     if (!doc.exists) return;

//     var data = doc.data()!;
//     List<String> excludedMonths =
//         List<String>.from(data['excludedMonths'] ?? []);
//     excludedMonths.add(monthKey);

//     await collection
//         .doc(transactionId)
//         .update({'excludedMonths': excludedMonths});
//   }

//   Future<void> addFinalDate(String transactionId, String monthKey) async {
//     var finalDate = StringUtils.getDateFromMonthKey(monthKey);

//     await collection.doc(transactionId).update({'finalDate': finalDate});
//   }

//   Future<TransactionEntryEntity?> getTransaction(String transactionId) async {
//     var doc = await collection.doc(transactionId).get();
//     if (!doc.exists) return null;

//     return TransactionEntryEntity.fromMap(doc.data()!);
//   }
// }
