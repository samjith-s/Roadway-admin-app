part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required List<ChatOverView> totalChats,
    required List<Chat> currentUserMsgs,
    required bool isLoading,
    required bool isError,
    required List<ChatOverView> searchResult,
    required bool showSearchResult,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
        currentUserMsgs: [],
        totalChats: [],
        isLoading: false,
        isError: false,
        searchResult: [],
        showSearchResult: false,
      );
}
