class Notification {
  final String title;

  Notification({required this.title});
  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(title: json['']);
  }
}
