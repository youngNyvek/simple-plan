import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_plan/adapters/isarAdapter/categories/models/category_model.dart';
import 'package:simple_plan/adapters/isarAdapter/doneTransactions/models/done_transaction_model.dart';
import 'package:simple_plan/adapters/isarAdapter/scheduledNotifications/models/scheduled_notification_model.dart';
import 'package:simple_plan/adapters/isarAdapter/transactionEntries/models/transaction_entry_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsarAdapterBase {
  static late Isar db;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([
      DoneTransactionModelSchema,
      TransactionEntryModelSchema,
      CategoryModelSchema,
      ScheduledNotificationModelSchema
    ], directory: dir.path);

    _writeSeedIfFirstInitialization();
  }

  Future<T> executeInTransactionWithResult<T>(
      Future<T> Function() function) async {
    return await db.writeTxn(function);
  }

  Future<void> executeInTransaction(Future<void> Function() function) async {
    await db.writeTxn<void>(function);
  }

  static Future<void> _writeSeedIfFirstInitialization() async {
    final prefs = await SharedPreferences.getInstance();
    final isSeedExecuted = prefs.getBool('isSeedExecuted') ?? false;

    if (!isSeedExecuted) {
      await _writeSeed();
      await prefs.setBool('isSeedExecuted', true);
    }
  }

  static Future<void> _writeSeed() async {
    await db.writeTxn(() async {
      final bytes = await rootBundle.load('assets/json/seed_categories.json');
      final jsonString =
          const Utf8Decoder().convert(bytes.buffer.asUint8List());
      final jsonArray = json.decode(jsonString) as List;

      final categories = jsonArray.map((jsonMap) {
        if (jsonMap is Map<String, dynamic>) {
          var label = jsonMap['label'] as String;
          var ocurrenceType = jsonMap['ocurrenceType'] as int;

          return CategoryModel(label: label, ocurrenceType: ocurrenceType);
        }
        throw Exception("Formato de JSON inválido");
      }).toList();

      await db.categoryModels.putAll(categories);
    });
  }
}
