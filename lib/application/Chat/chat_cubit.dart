import 'dart:developer';

import 'package:admin/domain/chat/chat_model.dart';
import 'package:admin/domain/chat/chat_overview_model.dart';
import 'package:admin/domain/chat/chat_services.dart';
import 'package:admin/local_notifications_services.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final ChatServices _chatServices;
  ChatCubit(this._chatServices) : super(ChatState.initial());

  Future<void> getAllChats() async {
    Stream<List<ChatOverView>> snapshots = FirebaseFirestore.instance.collection('chats').snapshots().map(
          (event) => event.docs
              .map(
                (e) => ChatOverView.fromJson(e.data()),
              )
              .toList(),
        );

    snapshots.listen((event) {
      if (event.isNotEmpty) {
        emit(
          state.copyWith(
            totalChats: event,
            isLoading: false,
            showSearchResult: false,
          ),
        );
      }
    });
  }

  Future<void> addMessage({required Chat message}) async {
    try {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(message.userId)
          .collection('messages')
          .add(message.toJson())
          .then((value) => value.update({'msgId': value.id}))
          .onError(
            (error, stackTrace) => print('error while uploading chat'),
          );

      FirebaseFirestore.instance.collection('chats').doc(message.userId).update({
        'lastmessage': message.message,
        'time': Timestamp.now(),
      });
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await FirebaseFirestore.instance.collection('users').doc(message.userId).get();

      LocalNotificationService().sendPushMessage(
        userDoc.data()!['token'],
        message.message,
        'New message',
      );
      getAllMessages(userId: message.userId!);
    } catch (e) {
      log('errk from chat while addchat');
    }
  }

  Future<void> deleteChat({required Chat message, required bool isLast}) async {
    try {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(message.userId)
          .collection('messages')
          .doc(message.msgId)
          .delete()
          .onError(
            (error, stackTrace) => print('error while uploading chat'),
          );
      log('$isLast is from deleted');
      if (isLast) {
        FirebaseFirestore.instance.collection('chats').doc(message.userId).update(
          {'lastmessage': 'this message is deleted'},
        );
      }

      getAllMessages(userId: message.userId!);
    } catch (e) {
      log('errk from chat while addchat');
    }
  }

  Future<void> searchChats({
    required String searchKey,
    required List<ChatOverView> totalChats,
  }) async {
    List<ChatOverView> searchResult = [];
    searchResult = totalChats
        .where(
          (element) => element.userName.toLowerCase().contains(
                searchKey.toLowerCase(),
              ),
        )
        .toList();
    emit(state.copyWith(
      searchResult: searchResult,
      showSearchResult: true,
    ));
  }

  Future<void> getAllMessages({required String userId}) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    List<Chat> chats = await _chatServices.getAllMessages(userId: userId);
    emit(
      state.copyWith(
        currentUserMsgs: chats,
        isLoading: false,
      ),
    );
  }
}
