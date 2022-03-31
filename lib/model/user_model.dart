class UserModel {
  String? userId;
  String? name;
  String? email;
  String? avatar;
  UserModel({this.userId, this.name, this.email, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['\$id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['\$id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;

    return data;
  }
}
