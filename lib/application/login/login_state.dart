part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool loginStatus,
    required String message,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        loginStatus: false,
        message: '',
      );
}
