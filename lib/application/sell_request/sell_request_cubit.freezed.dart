// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sell_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SellRequestState {
  bool get isError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;
  bool get showSearchResult => throw _privateConstructorUsedError;
  List<SellRequest> get searchResult => throw _privateConstructorUsedError;
  List<SellRequest> get totalRequests => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellRequestStateCopyWith<SellRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellRequestStateCopyWith<$Res> {
  factory $SellRequestStateCopyWith(
          SellRequestState value, $Res Function(SellRequestState) then) =
      _$SellRequestStateCopyWithImpl<$Res>;
  $Res call(
      {bool isError,
      bool isLoading,
      String errorText,
      bool showSearchResult,
      List<SellRequest> searchResult,
      List<SellRequest> totalRequests});
}

/// @nodoc
class _$SellRequestStateCopyWithImpl<$Res>
    implements $SellRequestStateCopyWith<$Res> {
  _$SellRequestStateCopyWithImpl(this._value, this._then);

  final SellRequestState _value;
  // ignore: unused_field
  final $Res Function(SellRequestState) _then;

  @override
  $Res call({
    Object? isError = freezed,
    Object? isLoading = freezed,
    Object? errorText = freezed,
    Object? showSearchResult = freezed,
    Object? searchResult = freezed,
    Object? totalRequests = freezed,
  }) {
    return _then(_value.copyWith(
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      showSearchResult: showSearchResult == freezed
          ? _value.showSearchResult
          : showSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<SellRequest>,
      totalRequests: totalRequests == freezed
          ? _value.totalRequests
          : totalRequests // ignore: cast_nullable_to_non_nullable
              as List<SellRequest>,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $SellRequestStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isError,
      bool isLoading,
      String errorText,
      bool showSearchResult,
      List<SellRequest> searchResult,
      List<SellRequest> totalRequests});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SellRequestStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? isError = freezed,
    Object? isLoading = freezed,
    Object? errorText = freezed,
    Object? showSearchResult = freezed,
    Object? searchResult = freezed,
    Object? totalRequests = freezed,
  }) {
    return _then(_$_Initial(
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      showSearchResult: showSearchResult == freezed
          ? _value.showSearchResult
          : showSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResult: searchResult == freezed
          ? _value._searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<SellRequest>,
      totalRequests: totalRequests == freezed
          ? _value._totalRequests
          : totalRequests // ignore: cast_nullable_to_non_nullable
              as List<SellRequest>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isError,
      required this.isLoading,
      required this.errorText,
      required this.showSearchResult,
      required final List<SellRequest> searchResult,
      required final List<SellRequest> totalRequests})
      : _searchResult = searchResult,
        _totalRequests = totalRequests;

  @override
  final bool isError;
  @override
  final bool isLoading;
  @override
  final String errorText;
  @override
  final bool showSearchResult;
  final List<SellRequest> _searchResult;
  @override
  List<SellRequest> get searchResult {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResult);
  }

  final List<SellRequest> _totalRequests;
  @override
  List<SellRequest> get totalRequests {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalRequests);
  }

  @override
  String toString() {
    return 'SellRequestState(isError: $isError, isLoading: $isLoading, errorText: $errorText, showSearchResult: $showSearchResult, searchResult: $searchResult, totalRequests: $totalRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.errorText, errorText) &&
            const DeepCollectionEquality()
                .equals(other.showSearchResult, showSearchResult) &&
            const DeepCollectionEquality()
                .equals(other._searchResult, _searchResult) &&
            const DeepCollectionEquality()
                .equals(other._totalRequests, _totalRequests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(errorText),
      const DeepCollectionEquality().hash(showSearchResult),
      const DeepCollectionEquality().hash(_searchResult),
      const DeepCollectionEquality().hash(_totalRequests));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements SellRequestState {
  const factory _Initial(
      {required final bool isError,
      required final bool isLoading,
      required final String errorText,
      required final bool showSearchResult,
      required final List<SellRequest> searchResult,
      required final List<SellRequest> totalRequests}) = _$_Initial;

  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String get errorText => throw _privateConstructorUsedError;
  @override
  bool get showSearchResult => throw _privateConstructorUsedError;
  @override
  List<SellRequest> get searchResult => throw _privateConstructorUsedError;
  @override
  List<SellRequest> get totalRequests => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
