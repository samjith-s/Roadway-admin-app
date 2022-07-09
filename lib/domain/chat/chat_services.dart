import 'package:admin/domain/chat/chat_model.dart';

abstract class ChatServices {
  // Future<List<ChatOverView>> getAllChats();
  Future<List<Chat>> getAllMessages({required String userId});
}
