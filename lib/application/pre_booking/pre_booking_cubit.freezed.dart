// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pre_booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PreBookingState {
  List<PreBooking> get totalBookings => throw _privateConstructorUsedError;
  List<PreBooking> get bookingSearchResult =>
      throw _privateConstructorUsedError;
  bool get showSearchResult => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreBookingStateCopyWith<PreBookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreBookingStateCopyWith<$Res> {
  factory $PreBookingStateCopyWith(
          PreBookingState value, $Res Function(PreBookingState) then) =
      _$PreBookingStateCopyWithImpl<$Res>;
  $Res call(
      {List<PreBooking> totalBookings,
      List<PreBooking> bookingSearchResult,
      bool showSearchResult,
      bool isLoading,
      bool isError,
      String errorText});
}

/// @nodoc
class _$PreBookingStateCopyWithImpl<$Res>
    implements $PreBookingStateCopyWith<$Res> {
  _$PreBookingStateCopyWithImpl(this._value, this._then);

  final PreBookingState _value;
  // ignore: unused_field
  final $Res Function(PreBookingState) _then;

  @override
  $Res call({
    Object? totalBookings = freezed,
    Object? bookingSearchResult = freezed,
    Object? showSearchResult = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      totalBookings: totalBookings == freezed
          ? _value.totalBookings
          : totalBookings // ignore: cast_nullable_to_non_nullable
              as List<PreBooking>,
      bookingSearchResult: bookingSearchResult == freezed
          ? _value.bookingSearchResult
          : bookingSearchResult // ignore: cast_nullable_to_non_nullable
              as List<PreBooking>,
      showSearchResult: showSearchResult == freezed
          ? _value.showSearchResult
          : showSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PreBookingStateCopyWith<$Res>
    implements $PreBookingStateCopyWith<$Res> {
  factory _$$_PreBookingStateCopyWith(
          _$_PreBookingState value, $Res Function(_$_PreBookingState) then) =
      __$$_PreBookingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<PreBooking> totalBookings,
      List<PreBooking> bookingSearchResult,
      bool showSearchResult,
      bool isLoading,
      bool isError,
      String errorText});
}

/// @nodoc
class __$$_PreBookingStateCopyWithImpl<$Res>
    extends _$PreBookingStateCopyWithImpl<$Res>
    implements _$$_PreBookingStateCopyWith<$Res> {
  __$$_PreBookingStateCopyWithImpl(
      _$_PreBookingState _value, $Res Function(_$_PreBookingState) _then)
      : super(_value, (v) => _then(v as _$_PreBookingState));

  @override
  _$_PreBookingState get _value => super._value as _$_PreBookingState;

  @override
  $Res call({
    Object? totalBookings = freezed,
    Object? bookingSearchResult = freezed,
    Object? showSearchResult = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_$_PreBookingState(
      totalBookings: totalBookings == freezed
          ? _value._totalBookings
          : totalBookings // ignore: cast_nullable_to_non_nullable
              as List<PreBooking>,
      bookingSearchResult: bookingSearchResult == freezed
          ? _value._bookingSearchResult
          : bookingSearchResult // ignore: cast_nullable_to_non_nullable
              as List<PreBooking>,
      showSearchResult: showSearchResult == freezed
          ? _value.showSearchResult
          : showSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PreBookingState implements _PreBookingState {
  const _$_PreBookingState(
      {required final List<PreBooking> totalBookings,
      required final List<PreBooking> bookingSearchResult,
      required this.showSearchResult,
      required this.isLoading,
      required this.isError,
      required this.errorText})
      : _totalBookings = totalBookings,
        _bookingSearchResult = bookingSearchResult;

  final List<PreBooking> _totalBookings;
  @override
  List<PreBooking> get totalBookings {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalBookings);
  }

  final List<PreBooking> _bookingSearchResult;
  @override
  List<PreBooking> get bookingSearchResult {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookingSearchResult);
  }

  @override
  final bool showSearchResult;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String errorText;

  @override
  String toString() {
    return 'PreBookingState(totalBookings: $totalBookings, bookingSearchResult: $bookingSearchResult, showSearchResult: $showSearchResult, isLoading: $isLoading, isError: $isError, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreBookingState &&
            const DeepCollectionEquality()
                .equals(other._totalBookings, _totalBookings) &&
            const DeepCollectionEquality()
                .equals(other._bookingSearchResult, _bookingSearchResult) &&
            const DeepCollectionEquality()
                .equals(other.showSearchResult, showSearchResult) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_totalBookings),
      const DeepCollectionEquality().hash(_bookingSearchResult),
      const DeepCollectionEquality().hash(showSearchResult),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$$_PreBookingStateCopyWith<_$_PreBookingState> get copyWith =>
      __$$_PreBookingStateCopyWithImpl<_$_PreBookingState>(this, _$identity);
}

abstract class _PreBookingState implements PreBookingState {
  const factory _PreBookingState(
      {required final List<PreBooking> totalBookings,
      required final List<PreBooking> bookingSearchResult,
      required final bool showSearchResult,
      required final bool isLoading,
      required final bool isError,
      required final String errorText}) = _$_PreBookingState;

  @override
  List<PreBooking> get totalBookings => throw _privateConstructorUsedError;
  @override
  List<PreBooking> get bookingSearchResult =>
      throw _privateConstructorUsedError;
  @override
  bool get showSearchResult => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  String get errorText => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PreBookingStateCopyWith<_$_PreBookingState> get copyWith =>
      throw _privateConstructorUsedError;
}
