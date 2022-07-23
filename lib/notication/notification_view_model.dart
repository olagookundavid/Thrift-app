import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrift_project/notication/notification_data.dart';

class NotificationDataController extends StateNotifier<NotificationData> {
  NotificationDataController() : super(NotificationData.initial()) {
    getNotifications();
  }

  Future<void> getNotifications() async {
    try {} catch (e) {
      state = state.copyWith(loader: Loader.error);
      rethrow;
    }
  }
}
