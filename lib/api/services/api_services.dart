import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:avengers_project/api/network_state/network_state.dart';
import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/model/user_model.dart';

class ApiServices {
  Client client = Client();
  late Account account;

  ApiServices() {
    _initService();
  }

  _initService() {
    account = Account(client);
    //String jwt = await LocalStorage.getAccessToken() ?? '';
    client.setEndpoint(Constants.endpoint).setProject(Constants.projectId);
    // .setJWT(jwt);
  }

  Future<String?> login(String email, String password) async {
    try {
      await account.createSession(email: email, password: password);

      final String token = await _createJWT() ?? '';

      return token;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    try {
      await account.updatePassword(
          password: newPassword, oldPassword: currentPassword);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<NetworkState<UserModel>> getUserInfo() async {
    try {
      final User user = await account.get();
      final userModel = UserModel.fromJson(user.toMap());
      return NetworkState<UserModel>(userModel);
    } catch (e) {
      log(e.toString());
      return NetworkState(UserModel());
    }
  }

  Future<String?> _createJWT() async {
    try {
      Jwt jwt = await account.createJWT();
      return jwt.jwt;
    } catch (e) {
      return e.toString();
    }
  }
}
