import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
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
    client.setEndpoint(Constants.endpoint).setProject(Constants.projectId);
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      await account.createSession(email: email, password: password);

      User user = await account.get();
      if (user.status == true) {
        return UserModel.fromJson(user.toMap());
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      log(e.toString());
    }
  }
}
