import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String message;
  final Timestamp time;
  final bool isAdmin;
  final String? msgId;
  final String? userId;
  

  Chat({
    required this.message,
    required this.time,
    required this.isAdmin,
    this.userId,
    this.msgId,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      message: json['message'],
      time: json['time'],
      isAdmin: json['isAdmin'],
      msgId: json['msgId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'time': time,
      'isAdmin': isAdmin,
      'msgId': msgId,
      'userId': userId,
    };
  }
}
