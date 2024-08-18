class Message{
  final String? uid;
  final String text;
  final DateTime createdAt;
  final String userId;
  final String recipientId;

  const Message({
    required this.uid,
    required this.userId,
    required this.text,
    required this.recipientId,
    required this.createdAt,
  });
}