class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final bool hasUnread;
  final int unreadCount;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.hasUnread = false,
    this.unreadCount = 2,
  });
}
