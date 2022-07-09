part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState({
    required bool isError,
    required bool isLoading,
    required List<UserModel> totalUsers,
    required bool showSearchResult,
    required List<UserModel> userSearchResult,
  }) = _Initial;

  factory UsersState.initial() => const UsersState(
        totalUsers: [],
        isError: false,
        isLoading: false,
        showSearchResult: false,
        userSearchResult: [],
      );
}
