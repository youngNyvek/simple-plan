import 'package:isar/isar.dart';
import 'package:simple_plan/domain/entities/notification_entity.dart';

part 'scheduled_notification_model.g.dart';

@Collection()
class ScheduledNotificationModel {
  Id id = Isar.autoIncrement;
  int notificationDay;

  ScheduledNotificationModel(this.notificationDay);

  ScheduledNotificationModel.fromEntity(ScheduledNotificationEntity entity)
      : id = entity.id ?? Isar.autoIncrement,
        notificationDay = entity.notificationDay;

  ScheduledNotificationEntity toEntity() {
    return ScheduledNotificationEntity(
        id: id, notificationDay: notificationDay);
  }
}

extension MapNotificationEntity on List<ScheduledNotificationModel> {
  List<ScheduledNotificationEntity> toEntity() {
    return map((e) => e.toEntity()).toList();
  }
}
