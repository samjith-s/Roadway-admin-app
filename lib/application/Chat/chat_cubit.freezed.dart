// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatState {
  List<ChatOverView> get totalChats => throw _privateConstructorUsedError;
  List<Chat> get currentUserMsgs => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<ChatOverView> get searchResult => throw _privateConstructorUsedError;
  bool get showSearchResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {List<ChatOverView> totalChats,
      List<Chat> currentUserMsgs,
      bool isLoading,
      bool isError,
      List<ChatOverView> searchResult,
      bool showSearchResult});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? totalChats = freezed,
    Object? currentUserMsgs = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? searchResult = freezed,
    Object? showSearchResult = freezed,
  }) {
    return _then(_value.copyWith(
      totalChats: totalChats == freezed
          ? _value.totalChats
          : totalChats // ignore: cast_nullable_to_non_nullable
              as List<ChatOverView>,
      currentUserMsgs: currentUserMsgs == freezed
          ? _value.currentUserMsgs
          : currentUserMsgs // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<ChatOverView>,
      showSearchResult: showSearchResult == freezed
          ? _value.showSearchResult
          : showSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_ChatStateCopyWith(
          _$_ChatState value, $Res Function(_$_ChatState) then) =
      __$$_ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ChatOverView> totalChats,
      List<Chat> currentUserMsgs,
      bool isLoading,
      bool isError,
      List<ChatOverView> searchResult,
      bool showSearchResult});
}

/// @nodoc
class __$$_ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$$_ChatStateCopyWith<$Res> {
  __$$_ChatStateCopyWithImpl(
      _$_ChatState _value, $Res Function(_$_ChatState) _then)
      : super(_value, (v) => _then(v as _$_ChatState));

  @override
  _$_ChatState get _value => super._value as _$_ChatState;

  @override
  $Res call({
    Object? totalChats = freezed,
    Object? currentUserMsgs = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? searchResult = freezed,
    Object? showSearchResult = freezed,
  }) {
    return _then(_$_ChatState(
      totalChats: totalChats == freezed
          ? _value._totalChats
          : totalChats // ignore: cast_nullable_to_non_nullable
              as List<ChatOverView>,
      currentUserMsgs: currentUserMsgs == freezed
          ? _value._currentUserMsgs
          : currentUserMsgs // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResult: searchResult == freezed
          ? _value._searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<ChatOverView>,
      showSearchResult: showSearchResult == freezed
          ? _value.showSearchResult
          : showSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChatState implements _ChatState {
  const _$_ChatState(
      {required final List<ChatOverView> totalChats,
      required final List<Chat> currentUserMsgs,
      required this.isLoading,
      required this.isError,
      required final List<ChatOverView> searchResult,
      required this.showSearchResult})
      : _totalChats = totalChats,
        _currentUserMsgs = currentUserMsgs,
        _searchResult = searchResult;

  final List<ChatOverView> _totalChats;
  @override
  List<ChatOverView> get totalChats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalChats);
  }

  final List<Chat> _currentUserMsgs;
  @override
  List<Chat> get currentUserMsgs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentUserMsgs);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<ChatOverView> _searchResult;
  @override
  List<ChatOverView> get searchResult {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResult);
  }

  @override
  final bool showSearchResult;

  @override
  String toString() {
    return 'ChatState(totalChats: $totalChats, currentUserMsgs: $currentUserMsgs, isLoading: $isLoading, isError: $isError, searchResult: $searchResult, showSearchResult: $showSearchResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatState &&
            const DeepCollectionEquality()
                .equals(other._totalChats, _totalChats) &&
            const DeepCollectionEquality()
                .equals(other._currentUserMsgs, _currentUserMsgs) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality()
                .equals(other._searchResult, _searchResult) &&
            const DeepCollectionEquality()
                .equals(other.showSearchResult, showSearchResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_totalChats),
      const DeepCollectionEquality().hash(_currentUserMsgs),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(_searchResult),
      const DeepCollectionEquality().hash(showSearchResult));

  @JsonKey(ignore: true)
  @override
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      __$$_ChatStateCopyWithImpl<_$_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {required final List<ChatOverView> totalChats,
      required final List<Chat> currentUserMsgs,
      required final bool isLoading,
      required final bool isError,
      required final List<ChatOverView> searchResult,
      required final bool showSearchResult}) = _$_ChatState;

  @override
  List<ChatOverView> get totalChats => throw _privateConstructorUsedError;
  @override
  List<Chat> get currentUserMsgs => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  List<ChatOverView> get searchResult => throw _privateConstructorUsedError;
  @override
  bool get showSearchResult => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
