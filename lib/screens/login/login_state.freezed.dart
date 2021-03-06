// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call({bool showLoadingIndicator = false, bool? isUserLoggedIn}) {
    return _LoginState(
      showLoadingIndicator: showLoadingIndicator,
      isUserLoggedIn: isUserLoggedIn,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  bool get showLoadingIndicator => throw _privateConstructorUsedError;
  bool? get isUserLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call({bool showLoadingIndicator, bool? isUserLoggedIn});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? showLoadingIndicator = freezed,
    Object? isUserLoggedIn = freezed,
  }) {
    return _then(_value.copyWith(
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserLoggedIn: isUserLoggedIn == freezed
          ? _value.isUserLoggedIn
          : isUserLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call({bool showLoadingIndicator, bool? isUserLoggedIn});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object? showLoadingIndicator = freezed,
    Object? isUserLoggedIn = freezed,
  }) {
    return _then(_LoginState(
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserLoggedIn: isUserLoggedIn == freezed
          ? _value.isUserLoggedIn
          : isUserLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState({this.showLoadingIndicator = false, this.isUserLoggedIn});

  @JsonKey()
  @override
  final bool showLoadingIndicator;
  @override
  final bool? isUserLoggedIn;

  @override
  String toString() {
    return 'LoginState(showLoadingIndicator: $showLoadingIndicator, isUserLoggedIn: $isUserLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            const DeepCollectionEquality()
                .equals(other.showLoadingIndicator, showLoadingIndicator) &&
            const DeepCollectionEquality()
                .equals(other.isUserLoggedIn, isUserLoggedIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showLoadingIndicator),
      const DeepCollectionEquality().hash(isUserLoggedIn));

  @JsonKey(ignore: true)
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState({bool showLoadingIndicator, bool? isUserLoggedIn}) =
      _$_LoginState;

  @override
  bool get showLoadingIndicator;
  @override
  bool? get isUserLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
