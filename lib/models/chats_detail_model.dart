class Message {
  final String content;
  final bool isSentByMe;
  final String time;
  final bool isRead;

  Message({
    required this.content,
    required this.isSentByMe,
    required this.time,
    this.isRead = false,
  });
}