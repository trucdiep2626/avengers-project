import 'package:avengers_project/api/network_state/network_state.dart';
import 'package:avengers_project/api/services/api_services.dart';
import 'package:avengers_project/api/session/local_storage.dart';
import 'package:avengers_project/screens/login/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
    (_) => LoginStateNotifier());

class LoginStateNotifier extends StateNotifier<LoginState> {
  final Future<void> Function()? onLoginSuccessful;
  final Future<void> Function()? onLoginFailed;



  LoginStateNotifier({this.onLoginSuccessful, this.onLoginFailed})
      : super(const LoginState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(showLoadingIndicator: true);

    final result = await _callLoginApi(email, password);
    result.maybeWhen((data) async {
      //await _saveSession(data ?? '');

      state = state.copyWith(showLoadingIndicator: false, isUserLoggedIn: true);

      onLoginSuccessful!();
    }, orElse: () {
      onLoginFailed!();
    });
  }

  Future<void> logout() async {
    await ApiServices().logout();
    state = state.copyWith(isUserLoggedIn: false);
    await _destroySession();
  }

  Future<NetworkState<bool?>> _callLoginApi(
      String email, String password) async {
    final result = await ApiServices().login(email, password);

    if (result == false) {
      return const NetworkState.error([]);
    }
    return NetworkState(result);
  }

  Future<void> _destroySession() async {
    await LocalStorage.deleteAccessToken();
  }
}
