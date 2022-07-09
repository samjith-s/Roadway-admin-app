part of 'internet_cubit.dart';

@freezed
class InternetState with _$InternetState {
  const factory InternetState({
    required bool networkOn,
  }) = _InternetState;

  factory InternetState.initial() => const InternetState(networkOn: false);
}
