class Message {
  final String id;
  final String userId;
  final String message;
  final String? to;
  final String? from;
  final String? music;
//   final DateTime? createdAt;

  Message({
    required this.id,
    required this.userId,
    required this.message,
    this.to,
    this.from,
    this.music,
    // this.createdAt,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'message': message,
      'to': to,
      'from': from,
      'music': music,
      //   'created_at': createdAt.toUtc().toIso8601String(),
    };
  }

  // Create from JSON
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      userId: json['userId'],
      message: json['message'],
      to: json['to'],
      from: json['from'],
      music: json['music'],
      //   createdAt: DateTime.parse(json['created_at']),
    );
  }
}
