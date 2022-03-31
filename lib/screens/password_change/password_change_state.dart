import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_change_state.freezed.dart';

@freezed
abstract class PasswordChangeState with _$PasswordChangeState {
  const factory PasswordChangeState(
      {@Default(false) bool showLoadingIndicator}) = _PasswordChangeState;
}
