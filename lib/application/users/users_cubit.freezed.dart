// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsersState {
  bool get isError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserModel> get totalUsers => throw _privateConstructorUsedError;
  bool get showSearchResult => throw _privateConstructorUsedError;
  List<UserModel> get userSearchResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersStateCopyWith<UsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
          UsersState value, $Res Function(UsersState) then) =
      _$UsersStateCopyWithImpl<$Res>;
  $Res call(
      {bool isError,
      bool isLoading,
      List<UserModel> totalUsers,
      bool showSearchResult,
      List<UserModel> userSearchResult});
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res> implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._value, this._then);

  final UsersState _value;
  // ignore: unused_field
  final $Res Function(UsersState) _then;

  @override
  $Res call({
    Object? isError = freezed,
    Object? isLoading = freezed,
    Object? totalUsers = freezed,
    Object? showSearchResult = freezed,
    Object? userSearchResult = freezed,
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
      totalUsers: totalUsers == freezed
          ? _value.totalUsers
          : totalUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      showSearchResult: showSearchResult == freezed
          ? _value.showSearchResult
          : showSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      userSearchResult: userSearchResult == freezed
          ? _value.userSearchResult
          : userSearchResult // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isError,
      bool isLoading,
      List<UserModel> totalUsers,
      bool showSearchResult,
      List<UserModel> userSearchResult});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$UsersStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? isError = freezed,
    Object? isLoading = freezed,
    Object? totalUsers = freezed,
    Object? showSearchResult = freezed,
    Object? userSearchResult = freezed,
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
      totalUsers: totalUsers == freezed
          ? _value._totalUsers
          : totalUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      showSearchResult: showSearchResult == freezed
          ? _value.showSearchResult
          : showSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      userSearchResult: userSearchResult == freezed
          ? _value._userSearchResult
          : userSearchResult // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isError,
      required this.isLoading,
      required final List<UserModel> totalUsers,
      required this.showSearchResult,
      required final List<UserModel> userSearchResult})
      : _totalUsers = totalUsers,
        _userSearchResult = userSearchResult;

  @override
  final bool isError;
  @override
  final bool isLoading;
  final List<UserModel> _totalUsers;
  @override
  List<UserModel> get totalUsers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalUsers);
  }

  @override
  final bool showSearchResult;
  final List<UserModel> _userSearchResult;
  @override
  List<UserModel> get userSearchResult {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSearchResult);
  }

  @override
  String toString() {
    return 'UsersState(isError: $isError, isLoading: $isLoading, totalUsers: $totalUsers, showSearchResult: $showSearchResult, userSearchResult: $userSearchResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._totalUsers, _totalUsers) &&
            const DeepCollectionEquality()
                .equals(other.showSearchResult, showSearchResult) &&
            const DeepCollectionEquality()
                .equals(other._userSearchResult, _userSearchResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_totalUsers),
      const DeepCollectionEquality().hash(showSearchResult),
      const DeepCollectionEquality().hash(_userSearchResult));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements UsersState {
  const factory _Initial(
      {required final bool isError,
      required final bool isLoading,
      required final List<UserModel> totalUsers,
      required final bool showSearchResult,
      required final List<UserModel> userSearchResult}) = _$_Initial;

  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  List<UserModel> get totalUsers => throw _privateConstructorUsedError;
  @override
  bool get showSearchResult => throw _privateConstructorUsedError;
  @override
  List<UserModel> get userSearchResult => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
