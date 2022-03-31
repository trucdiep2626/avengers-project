import 'package:avengers_project/api/services/api_services.dart';
import 'package:avengers_project/api/session/local_storage.dart';
import 'package:avengers_project/screens/password_change/password_change_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordChangeProvider =
    StateNotifierProvider<PasswordChangeStateNotifier, PasswordChangeState>(
        (_) => PasswordChangeStateNotifier());

class PasswordChangeStateNotifier extends StateNotifier<PasswordChangeState> {
  final Future<void> Function()? onChangeSuccessful;
  final Future<void> Function()? onChangeFailed;

  PasswordChangeStateNotifier({this.onChangeSuccessful, this.onChangeFailed})
      : super(const PasswordChangeState());

  Future<void> changePassword(String currentPassword, String newPassword,
      String newPasswordConfirm) async {
    state = state.copyWith(showLoadingIndicator: true);

    if (newPasswordConfirm == newPassword) {
      await ApiServices().changePassword(currentPassword, newPassword);

      await _destroySession();

      state = state.copyWith(showLoadingIndicator: false);

      onChangeSuccessful!();
    }

    onChangeFailed!();
  }

  Future<void> _destroySession() async {
    await LocalStorage.deleteAccessToken();
  }
}
