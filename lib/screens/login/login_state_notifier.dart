import 'package:avengers_project/api/network_state/network_state.dart';
import 'package:avengers_project/api/services/api_services.dart';
import 'package:avengers_project/api/session/local_storage.dart';
import 'package:avengers_project/model/user_model.dart';
import 'package:avengers_project/screens/login/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  final Future<void> Function()? onLoginSuccessful;
  final Future<void> Function()? onLoginFailed;

  LoginStateNotifier({this.onLoginSuccessful, this.onLoginFailed})
      : super(const LoginState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(showLoadingIndicator: true);

    final result = await _callLoginApi(email, password);
    result.maybeWhen((data) async {
      String userId = data?.userId ?? '';
      await _saveSession(userId);
      onLoginSuccessful!();
    }, orElse: () {
      onLoginFailed!();
    });
  }

  Future<void> logout() async {
    await ApiServices().logout();
    await _destroySession();
  }

  Future<NetworkState<UserModel>> _callLoginApi(
      String email, String password) async {
    final result = await ApiServices().login(email, password);

    if (result == null) {
      return const NetworkState.error([]);
    }
    return NetworkState(result);
  }

  Future<void> _saveSession(String userId) async {
    await LocalStorage.saveAccessToken(userId);
  }

  Future<void> _destroySession() async {
    await LocalStorage.deleteAccessToken();
  }
}
