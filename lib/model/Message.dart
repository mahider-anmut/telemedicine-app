class Message {
  final String? id;
  final String? senderId;
  final String? chatId;
  final String? messageType;
  final String? content;
  final DateTime? timestamp;
  final List<String>? seenBy;
  final int? duration;

  Message({this.id, this.messageType, this.chatId, this.content,this.timestamp,this.duration,this.seenBy,this.senderId});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      messageType: json['messageType'],
      chatId: json['chatId'],
      senderId: json['senderId'],
      content: json['content'],
      duration: json['duration'],
      timestamp: DateTime.parse(json['createdAt']),
      seenBy: List<String>.from(json['seenBy']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'messageType': messageType,
      'chatId': chatId,
      'content': content,
      'timestamp': timestamp,
      'seenBy': seenBy,
      'duration': duration,
      'senderId': senderId,
    };
  }
}
