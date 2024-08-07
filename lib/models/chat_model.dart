class Chat {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final int unreadCount;
  final bool isTyping;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    this.unreadCount = 0,
    this.isTyping = false,
  });
}
