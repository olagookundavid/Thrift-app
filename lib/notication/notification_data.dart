import 'package:thrift_project/notication/notification_model.dart';

class NotificationData {
  final Loader? loader;
  final List<Notification>? notification;

  NotificationData({this.notification, this.loader});
  NotificationData.initial()
      : notification = [],
        loader = Loader.loading;

  NotificationData copyWith(
      {final Loader? loader, final List<Notification>? notification}) {
    return NotificationData(
        notification: notification ?? this.notification,
        loader: loader ?? this.loader);
  }
}

enum Loader { loading, error, success }
