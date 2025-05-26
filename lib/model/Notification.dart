class Notification {
  final String? id;
  final String? userId;
  final String? type;
  final String? title;
  final String? message;
  final String? createdAt;


  Notification({this.id, this.userId, this.type, this.title, this.message, this.createdAt});

  // Factory method to create a UserModel instance from JSON
  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['_id'],
      userId: json['userId'],
      type: json['type'],
      title: json['title'],
      message: json['message'],
      createdAt: json['createdAt'],
    );
  }

  // Method to convert UserModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'type': type,
      'title': title,
      'message': message,
      'createdAt': createdAt,
    };
  }
}
