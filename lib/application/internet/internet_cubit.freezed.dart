// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'internet_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InternetState {
  bool get networkOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InternetStateCopyWith<InternetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternetStateCopyWith<$Res> {
  factory $InternetStateCopyWith(
          InternetState value, $Res Function(InternetState) then) =
      _$InternetStateCopyWithImpl<$Res>;
  $Res call({bool networkOn});
}

/// @nodoc
class _$InternetStateCopyWithImpl<$Res>
    implements $InternetStateCopyWith<$Res> {
  _$InternetStateCopyWithImpl(this._value, this._then);

  final InternetState _value;
  // ignore: unused_field
  final $Res Function(InternetState) _then;

  @override
  $Res call({
    Object? networkOn = freezed,
  }) {
    return _then(_value.copyWith(
      networkOn: networkOn == freezed
          ? _value.networkOn
          : networkOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InternetStateCopyWith<$Res>
    implements $InternetStateCopyWith<$Res> {
  factory _$$_InternetStateCopyWith(
          _$_InternetState value, $Res Function(_$_InternetState) then) =
      __$$_InternetStateCopyWithImpl<$Res>;
  @override
  $Res call({bool networkOn});
}

/// @nodoc
class __$$_InternetStateCopyWithImpl<$Res>
    extends _$InternetStateCopyWithImpl<$Res>
    implements _$$_InternetStateCopyWith<$Res> {
  __$$_InternetStateCopyWithImpl(
      _$_InternetState _value, $Res Function(_$_InternetState) _then)
      : super(_value, (v) => _then(v as _$_InternetState));

  @override
  _$_InternetState get _value => super._value as _$_InternetState;

  @override
  $Res call({
    Object? networkOn = freezed,
  }) {
    return _then(_$_InternetState(
      networkOn: networkOn == freezed
          ? _value.networkOn
          : networkOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InternetState implements _InternetState {
  const _$_InternetState({required this.networkOn});

  @override
  final bool networkOn;

  @override
  String toString() {
    return 'InternetState(networkOn: $networkOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InternetState &&
            const DeepCollectionEquality().equals(other.networkOn, networkOn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(networkOn));

  @JsonKey(ignore: true)
  @override
  _$$_InternetStateCopyWith<_$_InternetState> get copyWith =>
      __$$_InternetStateCopyWithImpl<_$_InternetState>(this, _$identity);
}

abstract class _InternetState implements InternetState {
  const factory _InternetState({required final bool networkOn}) =
      _$_InternetState;

  @override
  bool get networkOn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InternetStateCopyWith<_$_InternetState> get copyWith =>
      throw _privateConstructorUsedError;
}
