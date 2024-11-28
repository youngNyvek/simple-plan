import 'package:isar/isar.dart';
import 'package:simple_plan/adapters/isarAdapter/isar_adapter_base.dart';
import 'package:simple_plan/adapters/isarAdapter/scheduledNotifications/models/scheduled_notification_model.dart';
import 'package:simple_plan/domain/entities/notification_entity.dart';

class ScheduledNotificationAdapter extends IsarAdapterBase {
  static final db = IsarAdapterBase.db;

  Future<int> insertNotification(ScheduledNotificationEntity entity) async {
    var model = ScheduledNotificationModel.fromEntity(entity);

    return await db.scheduledNotificationModels.put(model);
  }

  Future<List<ScheduledNotificationEntity>> listNotifications() async {
    var notifications = await db.scheduledNotificationModels.where().findAll();

    return notifications.toEntity();
  }

  Future<ScheduledNotificationEntity?> getNotification(
      int notificationId) async {
    var model = await db.scheduledNotificationModels.get(notificationId);

    return model?.toEntity();
  }

  Future<void> deleteNotification(List<int> notificationIds) async {
    await db.scheduledNotificationModels.deleteAll(notificationIds);
  }
}
