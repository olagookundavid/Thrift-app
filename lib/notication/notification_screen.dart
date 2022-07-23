import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrift_project/notication/notification_data.dart';
import 'package:thrift_project/notication/notification_view_model.dart';

final notificationProvider =
    StateNotifierProvider<NotificationDataController, NotificationData>((ref) {
  return NotificationDataController();
});

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }
}
