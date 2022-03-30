import 'dart:developer';

import 'package:appwrite/appwrite.dart';
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

      Response response = await account.get() as Response;
      if (response.data != null) {
        return UserModel.fromJson(response.data);
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
