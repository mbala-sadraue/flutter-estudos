class Message {
  final String? uid;
  final String text;
  final DateTime createdAt;
  final String userId;
  final String recipientId;

  const Message({
    this.uid,
    required this.userId,
    required this.text,
    required this.recipientId,
    required this.createdAt,
  });

  factory Message.fromJon(Map<String, dynamic> json) {
    return Message(
        uid: json["uid"] ?? '',
        userId: json["userId"],
        text: json["text"],
        recipientId: json["recipientId"],
        createdAt: json["createdAt"]);
  }

  toJson() {
    return {
      "uid": uid,
      "userId": userId,
      "text": text,
      "recipientId": recipientId,
      "createdAt": createdAt
    };
  }
}
