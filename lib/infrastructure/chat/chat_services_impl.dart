import 'dart:developer';
import 'package:admin/domain/chat/chat_model.dart';
import 'package:admin/domain/chat/chat_overview_model.dart';
import 'package:admin/domain/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatServices)
class ChatServicesImpl extends ChatServices {
  // @override
  // Future<List<ChatOverView>> getAllChats() async {
  //   List<ChatOverView> chats = [];
  //   try {
  //     CollectionReference msgRef = FirebaseFirestore.instance.collection('chats');

  //     QuerySnapshot<Object?> totalMsgDocs = await msgRef.get();

  //     if (totalMsgDocs.docs.isNotEmpty) {
  //       chats =
  //           totalMsgDocs.docs.map((message) => ChatOverView.fromJson(message.data() as Map<String, dynamic>)).toList();
  //     }
  //     return chats;
  //   } catch (e) {
  //     log(e.toString());
  //     return chats;
  //   }
  // }

  @override
  Future<List<Chat>> getAllMessages({required String userId}) async {
    List<Chat> messages = [];

    try {
      CollectionReference msgRef = FirebaseFirestore.instance.collection('chats').doc(userId).collection('messages');
      QuerySnapshot<Object?> msgDocs = await msgRef.get();
      if (msgDocs.docs.isNotEmpty) {
        messages = msgDocs.docs.map((e) => Chat.fromJson(e.data() as Map<String, dynamic>)).toList();
        messages.sort(
          (a, b) => b.time.compareTo(a.time),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    return messages;
  }
}
