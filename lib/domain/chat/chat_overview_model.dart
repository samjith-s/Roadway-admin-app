import 'package:cloud_firestore/cloud_firestore.dart';

class ChatOverView {
  final String userId;
  final String lastmessage;
  final Timestamp time;
  final String userName;
  final String? userImage;

  ChatOverView({
    required this.userId,
    required this.lastmessage,
    required this.time,
    required this.userName,
    this.userImage,
  });

  factory ChatOverView.fromJson(Map<String, dynamic> json) => ChatOverView(
        userId: json['userId'],
        lastmessage: json['lastmessage'],
        time: json['time'],
        userName: json['userName'],
        userImage: json['userImage']
      );
}
