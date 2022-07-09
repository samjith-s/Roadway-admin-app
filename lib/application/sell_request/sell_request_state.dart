part of 'sell_request_cubit.dart';

@freezed
class SellRequestState with _$SellRequestState {
  const factory SellRequestState({
    required bool isError,
    required bool isLoading,
    required String errorText,
    required bool showSearchResult,
    required List<SellRequest> searchResult,
    required List<SellRequest> totalRequests,
  }) = _Initial;

  factory SellRequestState.initial() => const SellRequestState(
        searchResult: [],
        totalRequests: [],
        showSearchResult: false,
        errorText: '',
        isError: false,
        isLoading: false,
      );
}
