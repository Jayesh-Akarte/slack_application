class MessageModel {
  final String id;
  final String sender;
  final String content;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.sender,
    required this.content,
    required this.timestamp,
  });
}