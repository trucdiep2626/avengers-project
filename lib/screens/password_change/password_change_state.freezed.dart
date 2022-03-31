// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password_change_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PasswordChangeStateTearOff {
  const _$PasswordChangeStateTearOff();

  _PasswordChangeState call({bool showLoadingIndicator = false}) {
    return _PasswordChangeState(
      showLoadingIndicator: showLoadingIndicator,
    );
  }
}

/// @nodoc
const $PasswordChangeState = _$PasswordChangeStateTearOff();

/// @nodoc
mixin _$PasswordChangeState {
  bool get showLoadingIndicator => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordChangeStateCopyWith<PasswordChangeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangeStateCopyWith<$Res> {
  factory $PasswordChangeStateCopyWith(
          PasswordChangeState value, $Res Function(PasswordChangeState) then) =
      _$PasswordChangeStateCopyWithImpl<$Res>;
  $Res call({bool showLoadingIndicator});
}

/// @nodoc
class _$PasswordChangeStateCopyWithImpl<$Res>
    implements $PasswordChangeStateCopyWith<$Res> {
  _$PasswordChangeStateCopyWithImpl(this._value, this._then);

  final PasswordChangeState _value;
  // ignore: unused_field
  final $Res Function(PasswordChangeState) _then;

  @override
  $Res call({
    Object? showLoadingIndicator = freezed,
  }) {
    return _then(_value.copyWith(
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PasswordChangeStateCopyWith<$Res>
    implements $PasswordChangeStateCopyWith<$Res> {
  factory _$PasswordChangeStateCopyWith(_PasswordChangeState value,
          $Res Function(_PasswordChangeState) then) =
      __$PasswordChangeStateCopyWithImpl<$Res>;
  @override
  $Res call({bool showLoadingIndicator});
}

/// @nodoc
class __$PasswordChangeStateCopyWithImpl<$Res>
    extends _$PasswordChangeStateCopyWithImpl<$Res>
    implements _$PasswordChangeStateCopyWith<$Res> {
  __$PasswordChangeStateCopyWithImpl(
      _PasswordChangeState _value, $Res Function(_PasswordChangeState) _then)
      : super(_value, (v) => _then(v as _PasswordChangeState));

  @override
  _PasswordChangeState get _value => super._value as _PasswordChangeState;

  @override
  $Res call({
    Object? showLoadingIndicator = freezed,
  }) {
    return _then(_PasswordChangeState(
      showLoadingIndicator: showLoadingIndicator == freezed
          ? _value.showLoadingIndicator
          : showLoadingIndicator // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PasswordChangeState implements _PasswordChangeState {
  const _$_PasswordChangeState({this.showLoadingIndicator = false});

  @JsonKey()
  @override
  final bool showLoadingIndicator;

  @override
  String toString() {
    return 'PasswordChangeState(showLoadingIndicator: $showLoadingIndicator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordChangeState &&
            const DeepCollectionEquality()
                .equals(other.showLoadingIndicator, showLoadingIndicator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(showLoadingIndicator));

  @JsonKey(ignore: true)
  @override
  _$PasswordChangeStateCopyWith<_PasswordChangeState> get copyWith =>
      __$PasswordChangeStateCopyWithImpl<_PasswordChangeState>(
          this, _$identity);
}

abstract class _PasswordChangeState implements PasswordChangeState {
  const factory _PasswordChangeState({bool showLoadingIndicator}) =
      _$_PasswordChangeState;

  @override
  bool get showLoadingIndicator;
  @override
  @JsonKey(ignore: true)
  _$PasswordChangeStateCopyWith<_PasswordChangeState> get copyWith =>
      throw _privateConstructorUsedError;
}
