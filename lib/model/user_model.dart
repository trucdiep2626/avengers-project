import 'dart:typed_data';

class UserModel {
  String? userId;
  String? name;
  String? email;
  Uint8List? avatar;
  UserModel({this.userId, this.name, this.email, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['\$id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['\$id'] = userId;
    data['name'] = name;
    data['email'] = email;

    return data;
  }
}
