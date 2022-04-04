import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:avengers_project/api/network_state/network_state.dart';
import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/model/user_model.dart';

class ApiServices {
  Client client = Client();
  late Account account;
  late Storage storage;

  ApiServices() {
    _initService();
  }

  _initService() {
    account = Account(client);
    storage = Storage(client);
    client.setEndpoint(Constants.endpoint).setProject(Constants.projectId);
   
  }

  Future<bool> login(String email, String password) async {
    try {
      await account.createSession(email: email, password: password);

     

      return true;
    } catch (e) {
      log(e.toString());
      return false;
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
      String fileId= user.prefs.data['id']; 
      final res = await storage.getFilePreview(bucketId: "624a9a1b71ae460c77f5", fileId: fileId,height: 150,width: 150);
      userModel.avatar= res;
      return NetworkState<UserModel>(userModel);
    } catch (e) {
      log(e.toString());
      return NetworkState(UserModel());
    }
  }
  Future<Map<String, dynamic>> updatePrefs(Map<String, dynamic> prefs) async{
    final res = await account.updatePrefs(prefs: prefs);
    return res.prefs.data;
  }

}
