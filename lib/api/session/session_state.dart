import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_state.freezed.dart';

@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState({
    String? userId,
    String? token,
  }) = _SessionState;
}
